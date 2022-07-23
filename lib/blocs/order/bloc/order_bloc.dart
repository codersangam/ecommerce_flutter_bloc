import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter_bloc/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_flutter_bloc/data/repositories/orders/orders_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CartBloc _cartBloc;
  final OrdersRepository _ordersRepository;
  StreamSubscription? _ordersSubscription;

  OrderBloc(
      {required CartBloc cartBloc, required OrdersRepository ordersRepository})
      : _cartBloc = cartBloc,
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
  }
}
