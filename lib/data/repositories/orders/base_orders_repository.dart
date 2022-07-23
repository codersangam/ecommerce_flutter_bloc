import '../../models/models.dart';

abstract class BaseOrdersRepository {
  Future<void> addOrders(Orders orders);
}
