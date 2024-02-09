import 'dart:async';
import 'package:shopper/api/cart/cart.dart';
import 'package:shopper/api/favorite/favorite_api.dart';
import 'package:shopper/api/favorite/favorite_firebase_api.dart';
import 'package:shopper/api/product/product.dart';
import 'package:shopper/models/models.dart';

class ProductRepository {
  ProductRepository(
      {ProductApi? productApiClient,
      FavoriteApi? favoriteApiClient,
      CartApi? cartApiClient})
      : _productApiClient = productApiClient ?? ProductFirebaseApi(),
        _favoriteApiClient = favoriteApiClient ?? FavoriteFirebaseApi(),
        _cartApiClient = cartApiClient ?? CartFirebaseApi();

  final ProductApi _productApiClient;
  final FavoriteApi _favoriteApiClient;
  final CartApi _cartApiClient;

  Future<List<Product>> getProductList(String userId) async {
    final products = await _productApiClient.fetchProducts();
    final favorites = await _favoriteApiClient.fetchFavorites(userId);
    final cart = await _cartApiClient.fetchCart(userId);

    return products.map((e) {
      final isFavorite = favorites.where(
        (element) => e.id == element.productId,
      );

      final inCart = cart.where(
        (element) => e.id == element.productId,
      );
      return e.copyWith(
          id: e.id,
          isFavorite: isFavorite.isNotEmpty,
          inCart: inCart.isNotEmpty);
    }).toList();
  }
}
