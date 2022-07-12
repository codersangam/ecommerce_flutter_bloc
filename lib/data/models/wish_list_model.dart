import 'package:ecommerce_flutter_bloc/data/models/models.dart';
import 'package:equatable/equatable.dart';

class WishList extends Equatable {
  final List<Product> products;
  const WishList({this.products = const <Product>[]});
  @override
  List<Object?> get props => [products];
}
