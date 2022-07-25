part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class UpdateOrdersEvent extends OrderEvent {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final Cart? cart;
  final PaymentMethods? paymentMethods;

  const UpdateOrdersEvent({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.cart,
    this.paymentMethods,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        phoneNumber,
        address,
        city,
        country,
        zipCode,
        cart,
        paymentMethods
      ];
}

class ConfirmOrdersEvent extends OrderEvent {
  final Orders orders;

  const ConfirmOrdersEvent({required this.orders});

  @override
  List<Object?> get props => [orders];
}
