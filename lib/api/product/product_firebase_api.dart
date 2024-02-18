import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopper/api/firebase/firebase.dart';
import 'package:shopper/api/product/product_api.dart';
import 'package:shopper/models/models.dart';

class ProductFirebaseApi extends ProductApi {
  final db = FirebaseFirestore.instance;
  @override
  Future<List<Product>> fetchProducts({int page = 0}) async {
    final event = await db.collection(FirebaseDbKeys.products).get();
    List<Product> products = [];
    for (var doc in event.docs) {
      products.add(Product.fromJson(doc.data()));
    }
    return products;
  }

  @override
  Future<Product> fetchProduct(String id) async {
    final event = await db.collection(FirebaseDbKeys.products).doc(id).get();
    if (event.exists) {
      return Product.fromJson(event.data()!);
    } else {
      throw Error();
    }
  }
}
