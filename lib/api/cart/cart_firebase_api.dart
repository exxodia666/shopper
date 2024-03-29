import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopper/api/cart/cart_api.dart';
import 'package:shopper/api/firebase/firebase.dart';
import 'package:shopper/models/cart/cart.dart';

class CartFirebaseApi extends CartApi {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> addToCart(userId, productId) async {
    final cartItem = CartItem(userId: userId, productId: productId);
    await db
        .collection(FirebaseDbKeys.cart)
        .doc("$userId$productId")
        .set(cartItem.toJson());
  }

  @override
  Future<void> removeFromCart(userId, productId) async {
    await db.collection(FirebaseDbKeys.cart).doc("$userId$productId").delete();
  }

  @override
  Future<CartItem?> fetchCartItem(String userId, String productId) async {
    final event = await db
        .collection(FirebaseDbKeys.cart)
        .where('userId', isEqualTo: userId)
        .where('productId', isEqualTo: productId)
        .get();
    if (event.docs.isEmpty) {
      return null;
    }
    return CartItem.fromJson(event.docs[0].data());
  }

  @override
  Future<List<CartItem>> fetchCart(String userId) async {
    final event = await db
        .collection(FirebaseDbKeys.cart)
        .where('userId', isEqualTo: userId)
        .get();
    return event.docs.map((e) => CartItem.fromJson(e.data())).toList();
  }

  @override
  Future<void> changeCartItemCount(
      String userId, String productId, int count) async {
    await db
        .collection(FirebaseDbKeys.cart)
        .doc("$userId$productId")
        .set({'count': count}, SetOptions(merge: true));
  }

  @override
  Future<void> clearCart(String userId) async {
    final batch = db.batch();
    final querySnapshot = await db
        .collection(FirebaseDbKeys.cart)
        .where('userId', isEqualTo: userId)
        .get();
    for (var doc in querySnapshot.docs) {
      batch.delete(doc.reference);
    }
    return batch.commit();
  }
}
