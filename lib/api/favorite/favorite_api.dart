import 'package:shopper/models/favorite/favorite_product.dart';

abstract class FavoriteApi {
  FavoriteApi();

  Future<FavoriteProduct?> fetchFavorite(String userId, String productId);
  Future<List<FavoriteProduct>> fetchFavorites(String userId);

  Future<void> addToFavorite(String userId, String productId);
  Future<void> removeFromFavorite(String userId, String productId);
}
