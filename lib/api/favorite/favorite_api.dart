import 'package:shopper/models/favorite/favorite_product.dart';
import 'package:shopper/models/models.dart';

abstract class FavoriteApi {
  FavoriteApi();

  Future<List<Product>> fetchFavorite(String userId);
  Future<void> addToFavorite(FavoriteProduct product);
  Future<void> removeFromFavorite(String favoriteId);
}
