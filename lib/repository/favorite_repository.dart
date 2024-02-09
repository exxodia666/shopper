import 'dart:async';

import 'package:shopper/api/favorite/favorite_api.dart';
import 'package:shopper/api/favorite/favorite_firebase_api.dart';
import 'package:shopper/api/product/product.dart';
import 'package:shopper/models/favorite/favorite_product.dart';
import 'package:shopper/models/models.dart';
// import 'package:shopper/models/models.dart';

class FavoriteRepository {
  FavoriteRepository(
      {FavoriteApi? favoriteApiClient, ProductApi? productApiClient})
      : _favoriteApiClient = favoriteApiClient ?? FavoriteFirebaseApi(),
        _productApiClient = productApiClient ?? ProductFirebaseApi();

  final FavoriteApi _favoriteApiClient;
  final ProductApi _productApiClient;

  Future<void> addFavorite(String userId, String productId) async {
    print('req');
    await _favoriteApiClient.addToFavorite(userId, productId);
  }

  Future<void> removeFavorite(String userId, String productId) async {
    await _favoriteApiClient.removeFromFavorite(userId, productId);
  }

  Future<FavoriteProduct?> fetchFavorite(
      String userId, String productId) async {
    final favorite = await _favoriteApiClient.fetchFavorite(userId, productId);
    return favorite;
  }

  Future<List<FavoriteProduct>> fetchFavorites(String userId) async {
    final favorites = await _favoriteApiClient.fetchFavorites(userId);
    return favorites;
  }

  Future<List<Product>> fetchFavoriteList(String userId) async {
    final products = await _productApiClient.fetchProducts();
    final favorites = await _favoriteApiClient.fetchFavorites(userId);

    return products.where((element) {
      final isFavorite = favorites.where((favorite) {
        return favorite.productId == element.id;
      });
      return isFavorite.isEmpty ? false : true;
    }).toList();
  }
}
