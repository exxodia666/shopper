import 'dart:async';
import 'package:shopper/api/api.dart';
import 'package:shopper/models/models.dart';

class CartRepository {
  CartRepository({CartApi? cartApiClient, ProductApi? productApiClient})
      : _cartApiClient = cartApiClient ?? CartFirebaseApi(),
        _productApiClient = productApiClient ?? ProductFirebaseApi();

  final CartApi _cartApiClient;
  final ProductApi _productApiClient;

  Future<void> addToCart(String userId, String productId) async {
    await _cartApiClient.addToCart(userId, productId);
  }

  Future<void> removeFromCart(String userId, String productId) async {
    await _cartApiClient.removeFromCart(userId, productId);
  }

  Future<CartItem?> fetchCartItem(String userId, String productId) async {
    final cartItem = await _cartApiClient.fetchCartItem(userId, productId);
    return cartItem;
  }

  Future<List<CartItem>> fetchCart(String userId) async {
    final cart = await _cartApiClient.fetchCart(userId);
    return cart;
  }

  Future<List<Product>> fetchCartList(String userId) async {
    final products = await _productApiClient.fetchProducts();
    final cart = await _cartApiClient.fetchCart(userId);
    print(cart);
    return products.where((element) {
      final inCart = cart.where((cartItem) {
        return cartItem.productId == element.id;
      });
      return inCart.isEmpty ? false : true;
    }).toList();
  }
}
