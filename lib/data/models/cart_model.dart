import 'package:ecommerce_flutter_bloc/data/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;

  @override
  List<Object?> get props => [products];

  const Cart({this.products = const <Product>[]});

  double get subTotal =>
      products.fold(0.0, (total, current) => total + current.price);
  double get subTotalString => subTotal;
  double get totalString => subTotal;

  Map productQuantity(products) {
    var quantity = {};
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }
}
