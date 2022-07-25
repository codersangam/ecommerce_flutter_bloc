import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter_bloc/data/models/payment_methods_model.dart';
import 'package:equatable/equatable.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentLoadedState()) {
    on<LoadPaymentMethodsEvent>((event, Emitter<PaymentState> emit) {
      emit(const PaymentLoadedState());
    });

    on<SelectPaymentMethodsEvent>((event, Emitter<PaymentState> emit) {
      emit(PaymentLoadedState(paymentMethods: event.paymentMethods));
    });
  }
}
