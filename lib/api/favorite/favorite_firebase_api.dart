import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopper/api/favorite/favorite_api.dart';
import 'package:shopper/models/favorite/favorite_product.dart';
import 'package:shopper/models/models.dart';

class FavoriteFirebaseApi extends FavoriteApi {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> addToFavorite(FavoriteProduct product) async {
    await db.collection('favorite').add(product.toJson());
  }

  @override
  Future<List<Product>> fetchFavorite(String userId) async {
    final event = await db
        .collection('favorite')
        .where('userId', isEqualTo: userId)
        .get();

    if (event.docs.isEmpty) {
      return [];
    }

    List<String> ids = event.docs.map((e) {
      return e.data()['productId'] as String;
    }).toList();

    db.collection('products').where(FieldPath.documentId, whereIn: ids).get();

    List<Product> products = [];
    for (var doc in event.docs) {
      products.add(Product.fromJson(doc.data()));
    }
    return products;
  }

  @override
  Future<void> removeFromFavorite(String favoriteId) async {
    await db.collection('products').doc(favoriteId).delete();
  }
}
