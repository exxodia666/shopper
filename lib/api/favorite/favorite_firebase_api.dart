import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopper/api/favorite/favorite_api.dart';
import 'package:shopper/models/favorite/favorite_product.dart';

class FavoriteFirebaseApi extends FavoriteApi {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> addToFavorite(userId, productId) async {
    final favorite = FavoriteProduct(userId: userId, productId: productId);
    await db
        .collection('favorite')
        .doc("$userId$productId")
        .set(favorite.toJson());
  }

  @override
  Future<void> removeFromFavorite(userId, productId) async {
    await db.collection('favorite').doc("$userId$productId").delete();
  }

  @override
  Future<FavoriteProduct?> fetchFavorite(
      String userId, String productId) async {
    final event = await db
        .collection('favorite')
        .where('userId', isEqualTo: userId)
        .where('productId', isEqualTo: productId)
        .get();
    if (event.docs.isEmpty) {
      return null;
    }
    return FavoriteProduct.fromJson(event.docs[0].data());
  }

  @override
  Future<List<FavoriteProduct>> fetchFavorites(String userId) async {
    final event = await db
        .collection('favorite')
        .where('userId', isEqualTo: userId)
        .get();

    return event.docs.map((e) => FavoriteProduct.fromJson(e.data())).toList();
  }
}
