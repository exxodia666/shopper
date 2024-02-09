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
