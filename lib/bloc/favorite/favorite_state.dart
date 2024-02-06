part of 'favorite_bloc.dart';

enum FavoriteStatus { initial, success, failure, isLoading }

@JsonSerializable()
final class FavoriteState extends Equatable {
  const FavoriteState({
    this.status = FavoriteStatus.initial,
    this.favoriteProducts = const <Product>[],
  });

  final FavoriteStatus status;
  final List<Product> favoriteProducts;

  FavoriteState copyWith({
    FavoriteStatus? status,
    List<Product>? favoriteProducts,
    bool? hasReachedMax,
  }) {
    return FavoriteState(
      status: status ?? this.status,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
    );
  }

  factory FavoriteState.fromJson(Map<String, dynamic> json) =>
      _$FavoriteStateFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteStateToJson(this);

  @override
  List<Object> get props => [status, favoriteProducts];
}
