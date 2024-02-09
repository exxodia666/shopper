import 'package:json_annotation/json_annotation.dart';

part 'favorite_product.g.dart';

@JsonSerializable()
class FavoriteProduct {
  FavoriteProduct({required this.userId, required this.productId});
  final String userId;
  final String productId;

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) =>
      _$FavoriteProductFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteProductToJson(this);
}
