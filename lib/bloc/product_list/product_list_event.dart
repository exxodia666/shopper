part of 'product_list_bloc.dart';

sealed class ProductListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProductListFetch extends ProductListEvent {
  final String userId;

  ProductListFetch({required this.userId});
}

final class ChangeProduct extends ProductListEvent {
  final String productId;
  final bool? isFavorite;
  final bool? inCart;
  ChangeProduct({required this.productId, this.isFavorite, this.inCart});
}
