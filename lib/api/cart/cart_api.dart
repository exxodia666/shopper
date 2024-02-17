import 'package:shopper/models/cart/cart.dart';

abstract class CartApi {
  CartApi();

  Future<CartItem?> fetchCartItem(String userId, String productId);
  Future<List<CartItem>> fetchCart(String userId);

  Future<void> addToCart(String userId, String productId);
  Future<void> removeFromCart(String userId, String productId);

  Future<void> changeCartItemCount(String userId, String productId, int count);

  Future<void> clearCart(String userId);
}
