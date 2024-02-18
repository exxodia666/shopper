import 'package:shopper/api/firebase/firebase.dart';
import 'package:shopper/models/models.dart';
import 'package:uuid/uuid.dart';

import 'order_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderFirebaseApi extends OrderApi {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> cancellOrder(String orderId) async {
    await db.collection(FirebaseDbKeys.order).doc(orderId).set(
        {'status': OrderStatuses.cancelled.value}, SetOptions(merge: true));
  }

  @override
  Future<void> createOrder(
      String userId, List<CartItem> cartItems, double total) async {
    final id = const Uuid().v4();
    final batch = db.batch();
    await db
        .collection(FirebaseDbKeys.order)
        .doc(id)
        .set(OrderItem(id: id, userId: userId, total: total).toJson());

    final orderItemsRef = db.collection(FirebaseDbKeys.orderItems);

    for (var cartItem in cartItems) {
      batch.set(
          orderItemsRef.doc('$id${cartItem.productId}'), cartItem.toJson());
    }
    return batch.commit();
  }

  @override
  Future<List<OrderItem>> fetchOrders(String userId) async {
    final event = await db
        .collection(FirebaseDbKeys.order)
        .where('userId', isEqualTo: userId)
        .get();
    return event.docs.map((e) {
      return OrderItem.fromJson(e.data());
    }).toList();
  }
}
