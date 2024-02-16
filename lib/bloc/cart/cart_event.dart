part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class CartFetch extends CartEvent {
  CartFetch({required this.userId});
  final String userId;

  @override
  List<Object> get props => [userId];
}

final class AddToCart extends CartEvent {
  AddToCart({required this.userId, required this.productId});
  final String userId;
  final String productId;

  @override
  List<Object> get props => [userId, productId];
}

final class RemoveFromCart extends CartEvent {
  RemoveFromCart({required this.userId, required this.productId});
  final String userId;
  final String productId;

  @override
  List<Object> get props => [userId, productId];
}

enum Dir { incr, decr }

final class ChangeCartItemCount extends CartEvent {
  ChangeCartItemCount(
      {required this.userId, required this.productId, required this.dir});
  final String userId;
  final String productId;
  final Dir dir;

  @override
  List<Object> get props => [userId, productId];
}
