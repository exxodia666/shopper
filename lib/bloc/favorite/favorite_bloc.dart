import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/repository/favorite_repository.dart';
import 'package:shopper/repository/product_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';
part 'favorite_bloc.g.dart';

class FavoriteBloc extends HydratedBloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(this._favoriteRepository, this._productRepository)
      : super(const FavoriteState()) {
    on<FavoriteProductFetch>(_onFavoriteFetch);
    on<AddToFavorite>(_onAddFavorite);
    on<RemoveFromFavorite>(_onRemoveFavorite);
  }

  final FavoriteRepository _favoriteRepository;
  final ProductRepository _productRepository;

  Future<void> _onFavoriteFetch(
      FavoriteProductFetch event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(
      status: FavoriteStatus.isLoading,
    ));
    try {
      final products =
          await _favoriteRepository.fetchFavoriteList(event.userId);

      emit(state.copyWith(
          status: FavoriteStatus.success, favoriteProducts: products));
    } catch (e) {
      emit(state.copyWith(status: FavoriteStatus.failure));
    }
  }

  Future<void> _onRemoveFavorite(
      RemoveFromFavorite event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(
      status: FavoriteStatus.isLoading,
    ));
    try {
      await _favoriteRepository.removeFavorite(event.userId, event.productId);
      emit(state.copyWith(
        status: FavoriteStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: FavoriteStatus.failure));
    }
  }

  Future<void> _onAddFavorite(
      AddToFavorite event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(
      status: FavoriteStatus.isLoading,
    ));
    try {
      print('here');
      await _favoriteRepository.addFavorite(event.userId, event.productId);
      emit(state.copyWith(
        status: FavoriteStatus.success,
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: FavoriteStatus.failure));
    }
  }

  @override
  FavoriteState fromJson(Map<String, dynamic> json) {
    return FavoriteState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(FavoriteState state) {
    return state.toJson();
  }
}
