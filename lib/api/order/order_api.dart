import 'package:shopper/models/models.dart';

abstract class OrderApi {
  OrderApi();

  Future<List<OrderItem>> fetchOrders(String userId);

  Future<void> createOrder(
      String userId, List<CartItem> cartItems, double total);

  Future<void> cancellOrder(String orderId);
}
