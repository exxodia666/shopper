import 'package:shopper/models/models.dart';

abstract class ProductApi {
  ProductApi();
  Future<List<Product>> fetchProducts({int page = 0});
}
