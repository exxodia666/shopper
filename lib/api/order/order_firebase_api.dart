import 'package:shopper/models/models.dart';
import 'package:uuid/uuid.dart';

import 'order_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderFirebaseApi extends OrderApi {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> cancellOrder(String orderId) async {}

  @override
  Future<void> createOrder(String userId, List<CartItem> cartItems) async {
    final id = const Uuid().v4();
    final batch = db.batch();
    final event = await db
        .collection('order')
        .doc(id)
        .set(OrderItem(userId: userId, total: 1000.0).toJson());

    final orderItemsRef = db.collection('order_items');

    for (var cartItem in cartItems) {
      batch.set(orderItemsRef.doc('${cartItem.userId}${cartItem.productId}'),
          cartItem.toJson());
    }
    return batch.commit();
  }

  @override
  Future<List<OrderItem>> fetchOrders(String userId) async {
    final event =
        await db.collection('orders').where('userId', isEqualTo: userId).get();
    return event.docs.map((e) {
      return OrderItem.fromJson(e.data());
    }).toList();
  }
}
