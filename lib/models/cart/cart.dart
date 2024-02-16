import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class CartItem extends Equatable {
  const CartItem(
      {required this.userId, required this.productId, this.count = 1});
  final String userId;
  final String productId;
  final int count;

  CartItem copyWith({
    String? userId,
    String? productId,
    int? count,
  }) {
    return CartItem(
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      count: count ?? this.count,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  @override
  List<Object?> get props => [userId, count, productId];
}
