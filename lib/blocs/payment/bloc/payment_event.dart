part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class LoadPaymentMethodsEvent extends PaymentEvent {}

class SelectPaymentMethodsEvent extends PaymentEvent {
  final PaymentMethods paymentMethods;

  const SelectPaymentMethodsEvent({required this.paymentMethods});

  @override
  List<Object> get props => [paymentMethods];
}
