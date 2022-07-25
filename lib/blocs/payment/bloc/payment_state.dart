part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentLoadingState extends PaymentState {}

class PaymentLoadedState extends PaymentState {
  final PaymentMethods paymentMethods;

  const PaymentLoadedState({this.paymentMethods = PaymentMethods.razorpay});

  @override
  List<Object> get props => [paymentMethods];
}
