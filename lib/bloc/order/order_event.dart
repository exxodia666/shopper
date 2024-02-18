part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class OrderFetch extends OrderEvent {
  OrderFetch({required this.userId});
  final String userId;

  @override
  List<Object> get props => [userId];
}

final class CreateOrder extends OrderEvent {
  CreateOrder(
      {required this.userId, required this.cartItems, required this.total});
  final double total;
  final String userId;
  final List<CartItem> cartItems;
  @override
  List<Object> get props => [userId, cartItems];
}

final class CancellOrder extends OrderEvent {
  CancellOrder({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}
