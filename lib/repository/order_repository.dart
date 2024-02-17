import 'dart:async';
import 'package:shopper/api/api.dart';
import 'package:shopper/api/order/order_firebase_api.dart';
import 'package:shopper/models/models.dart';

class CardResponse {
  CardResponse({required this.products, required this.cartItems});
  final List<Product> products;
  final List<OrderItem> cartItems;
}

class OrderRepository {
  OrderRepository({OrderApi? cartApiClient, ProductApi? productApiClient})
      : _orderApiClient = cartApiClient ?? OrderFirebaseApi(),
        _productApiClient = productApiClient ?? ProductFirebaseApi();

  final OrderApi _orderApiClient;
  final ProductApi _productApiClient;

  Future<void> createOrder(String userId, List<CartItem> cartItems) async {
    await _orderApiClient.createOrder(userId, cartItems);
  }

  Future<void> cancellOrder(String id) async {
    await _orderApiClient.cancellOrder(id);
  }

  Future<List<OrderItem>> fetchOrders(String userId) async {
    final orders = await _orderApiClient.fetchOrders(userId);
    return orders;
  }
}
