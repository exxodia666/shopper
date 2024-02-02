import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:shopper/api/product/product_api.dart';
import 'package:shopper/models/product.dart';
import 'package:shopper/models/user.dart';
// import 'authentication_api.dart';
// import 'errors.dart';

class ProductFirebaseApi extends ProductApi {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<Product>> fetchProducts({int page = 0}) {
    // TODO: implement fetchProducts
    throw UnimplementedError();
  }
}

extension on firebase_auth.User {
  /// Maps a [firebase_auth.User] into a [User].
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
