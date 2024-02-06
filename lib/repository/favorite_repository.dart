import 'dart:async';

import 'package:shopper/api/favorite/favorite_api.dart';
import 'package:shopper/api/favorite/favorite_firebase_api.dart';
import 'package:shopper/models/favorite/favorite_product.dart';
import 'package:shopper/models/models.dart';

class FavoriteRepository {
  FavoriteRepository({FavoriteApi? apiClient})
      : _favoriteApiClient = apiClient ?? FavoriteFirebaseApi();

  final FavoriteApi _favoriteApiClient;

  Future<List<Product>> getFavorite(String userId) async {
    final products = await _favoriteApiClient.fetchFavorite(userId);
    return products;
  }

  Future<void> addFavorite(String userId, String productId) async {
    final favorite = FavoriteProduct(userId: userId, productId: productId);
    await _favoriteApiClient.addToFavorite(favorite);
  }

  Future<void> removeFavorite(String favoriteId) async {
    await _favoriteApiClient.fetchFavorite(favoriteId);
  }
}
