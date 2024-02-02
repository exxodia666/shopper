import 'package:shopper/models/product.dart';

abstract class ProductApi {
  ProductApi();
  Future<List<Product>> fetchProducts({int page = 0});
}
