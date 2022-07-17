import 'package:ecommerce_flutter_bloc/data/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;

  @override
  List<Object?> get props => [products];

  const Cart({this.products = const <Product>[]});

  num get subTotal =>
      products.fold(0.0, (total, current) => total + num.parse(current.price));
  String get subTotalString => subTotal.toString();
}
