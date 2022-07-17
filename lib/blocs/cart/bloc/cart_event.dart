part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStartedEvent extends CartEvent {}

class CartProductAddEvent extends CartEvent {
  final Product product;
  const CartProductAddEvent(this.product);

  @override
  List<Object> get props => [product];
}

class CartProductRemoveEvent extends CartEvent {
  final Product product;
  const CartProductRemoveEvent(this.product);

  @override
  List<Object> get props => [product];
}
