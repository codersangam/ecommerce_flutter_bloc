part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProductEvent extends ProductEvent {}

class UpdateProductEvent extends ProductEvent {
  final List<Product> product;

  const UpdateProductEvent(this.product);

  @override
  List<Object> get props => [product];
}
