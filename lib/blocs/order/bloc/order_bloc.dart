import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter_bloc/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_flutter_bloc/blocs/payment/bloc/payment_bloc.dart';
import 'package:ecommerce_flutter_bloc/data/models/payment_methods_model.dart';
import 'package:ecommerce_flutter_bloc/data/repositories/orders/orders_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CartBloc _cartBloc;
  final PaymentBloc _paymentBloc;
  final OrdersRepository _ordersRepository;
  StreamSubscription? _ordersSubscription;
  StreamSubscription? _paymentSubscription;

  OrderBloc(
      {required CartBloc cartBloc,
      required OrdersRepository ordersRepository,
      required PaymentBloc paymentBloc})
      : _cartBloc = cartBloc,
        _paymentBloc = paymentBloc,
        _ordersRepository = ordersRepository,
        super(cartBloc.state is CartLoadedState
            ? OrderLoadedState(
                products: (cartBloc.state as CartLoadedState).cart.products,
                total: (cartBloc.state as CartLoadedState).cart.totalString,
                subTotal:
                    (cartBloc.state as CartLoadedState).cart.subTotalString,
              )
            : OrderLoadingState()) {
    on<OrderEvent>((event, emit) {});

    on<UpdateOrdersEvent>((event, Emitter<OrderState> emit) {
      final state = this.state;
      if (state is OrderLoadedState) {
        emit(OrderLoadedState(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          phoneNumber: event.phoneNumber ?? state.phoneNumber,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode,
          products: event.cart?.products ?? state.products,
          total: event.cart?.totalString ?? state.total,
          subTotal: event.cart?.subTotalString ?? state.subTotal,
          paymentMethods: event.paymentMethods ?? state.paymentMethods,
        ));
      }
    });

    on<ConfirmOrdersEvent>((event, Emitter<OrderState> emit) async {
      _ordersSubscription?.cancel();
      if (state is OrderLoadedState) {
        try {
          await _ordersRepository.addOrders(event.orders);
          emit(OrderLoadingState());
        } catch (_) {}
      }
    });

    _ordersSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoadedState) {
        add(UpdateOrdersEvent(
          cart: state.cart,
        ));
      }
    });

    _paymentSubscription = _paymentBloc.stream.listen((state) {
      if (state is PaymentLoadedState) {
        add(UpdateOrdersEvent(
          paymentMethods: state.paymentMethods,
        ));
      }
    });
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    _paymentSubscription?.cancel();
    return super.close();
  }
}
