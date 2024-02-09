part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FavoriteProductFetch extends FavoriteEvent {
  FavoriteProductFetch({required this.userId});
  final String userId;

  @override
  List<Object> get props => [userId];
}

final class AddToFavorite extends FavoriteEvent {
  AddToFavorite({required this.userId, required this.productId});
  final String userId;
  final String productId;

  @override
  List<Object> get props => [userId, productId];
}

final class RemoveFromFavorite extends FavoriteEvent {
  RemoveFromFavorite({required this.userId, required this.productId});
  final String userId;
  final String productId;

  @override
  List<Object> get props => [userId, productId];
}
