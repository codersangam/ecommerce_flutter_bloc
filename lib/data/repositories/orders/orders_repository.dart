import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_bloc/data/models/models.dart';
import 'package:ecommerce_flutter_bloc/data/repositories/orders/base_orders_repository.dart';

class OrdersRepository extends BaseOrdersRepository {
  final FirebaseFirestore _firebaseFirestore;

  OrdersRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addOrders(Orders orders) {
    return _firebaseFirestore.collection('orders').add(orders.toDocument());
  }
}
