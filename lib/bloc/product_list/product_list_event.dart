part of 'product_list_bloc.dart';

sealed class ProductListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProductListFetch extends ProductListEvent {
  final String userId;

  ProductListFetch({required this.userId});
}

final class ChangeProductFavorite extends ProductListEvent {
  ChangeProductFavorite({required this.productId, required this.userId});
  final String productId;
  final String userId;
}

final class AddProductToCart extends ProductListEvent {
  AddProductToCart({required this.productId, required this.userId});
  final String productId;
  final String userId;
}
