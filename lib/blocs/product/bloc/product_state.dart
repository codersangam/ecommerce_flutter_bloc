part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<Product> product;

  const ProductLoadedState({this.product = const <Product>[]});

  @override
  List<Object> get props => [product];
}
