import 'dart:async';
import 'package:shopper/api/product/product.dart';
import 'package:shopper/models/models.dart';

class ProductRepository {
  ProductRepository({ProductApi? apiClient})
      : _productApiClient = apiClient ?? ProductFirebaseApi();

  final ProductApi _productApiClient;

  Future<List<Product>> getProduct() async {
    final products = await _productApiClient.fetchProducts();
    return products;
  }
}
