part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitialState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderLoadedState extends OrderState {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subTotal;
  final String? total;
  final Orders orders;
  final PaymentMethods paymentMethods;

  OrderLoadedState({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.products,
    this.subTotal,
    this.total,
    this.paymentMethods = PaymentMethods.razorpay,
  }) : orders = Orders(
          fullName: fullName,
          email: email,
          phoneNumber: phoneNumber,
          address: address,
          city: city,
          country: country,
          zipCode: zipCode,
          products: products,
          subTotal: subTotal,
          total: total,
          paymentMethods: paymentMethods,
        );

  @override
  List<Object?> get props => [
        fullName,
        email,
        phoneNumber,
        address,
        city,
        country,
        zipCode,
        products,
        subTotal,
        total,
        paymentMethods,
      ];
}
