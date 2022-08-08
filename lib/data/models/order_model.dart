import 'package:ecommerce_flutter_bloc/data/models/models.dart';
import 'package:ecommerce_flutter_bloc/data/models/payment_methods_model.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Orders extends Equatable {
  final String? id;
  final String? customerId;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final double? subTotal;
  final double? total;
  final bool? isAccepted;
  final bool? isCancelled;
  final bool? isDelivered;
  final DateTime? createdAt;
  final PaymentMethods? paymentMethods;

  const Orders({
    this.id,
    this.customerId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.products,
    this.isAccepted,
    this.isCancelled,
    this.isDelivered,
    this.createdAt,
    required this.subTotal,
    required this.total,
    required this.paymentMethods,
  });

  @override
  List<Object?> get props => [
        id,
        customerId,
        fullName,
        email,
        phoneNumber,
        address,
        city,
        country,
        zipCode,
        products,
        isAccepted,
        isCancelled,
        isDelivered,
        createdAt,
        subTotal,
        total,
        paymentMethods,
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = {};
    customerAddress['address'] = address;
    customerAddress['country'] = country;
    customerAddress['city'] = city;
    customerAddress['zipCode'] = zipCode;

    return {
      'id': const Uuid().v4(),
      'customerId': const Uuid().v4(),
      'fullName': fullName!,
      'email': email!,
      'phoneNumber': phoneNumber!,
      'customerAddress': customerAddress,
      'productIds': products!.map((product) => product.id).toList(),
      'isAccepted': isAccepted ?? false,
      'isCancelled': isCancelled ?? false,
      'isDelivered': isDelivered ?? false,
      'createdAt': createdAt ?? DateTime.now(),
      'subTotal': subTotal!,
      'total': total!,
      'paymentMethods': paymentMethods!.name,
    };
  }
}
