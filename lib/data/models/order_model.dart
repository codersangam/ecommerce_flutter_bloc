import 'package:ecommerce_flutter_bloc/data/models/models.dart';
import 'package:equatable/equatable.dart';

class Orders extends Equatable {
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

  const Orders(
      {required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.address,
      required this.city,
      required this.country,
      required this.zipCode,
      required this.products,
      required this.subTotal,
      required this.total});

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
        total
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = {};
    customerAddress['address'] = address;
    customerAddress['country'] = country;
    customerAddress['city'] = city;
    customerAddress['zipCode'] = zipCode;

    return {
      'fullName': fullName!,
      'email': email!,
      'phoneNumber': phoneNumber!,
      'customerAddress': customerAddress,
      'products': products!.map((product) => product.name).toList(),
      'subTotal': subTotal!,
      'total': total!,
    };
  }
}
