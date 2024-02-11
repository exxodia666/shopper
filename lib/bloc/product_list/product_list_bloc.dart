import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/repository/cart_repository.dart';
import 'package:shopper/repository/favorite_repository.dart';
import 'package:shopper/repository/product_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';
part 'product_list_bloc.g.dart';

class ProductListBloc extends HydratedBloc<ProductListEvent, ProductListState> {
  ProductListBloc(
      this._productRepository, this._favoriteRepository, this._cartRepository)
      : super(const ProductListState()) {
    on<ProductListFetch>(_onProductListFetch);
    on<ChangeProduct>(_changeProduct);
  }

  final ProductRepository _productRepository;
  final FavoriteRepository _favoriteRepository;
  final CartRepository _cartRepository;

  Future<void> _onProductListFetch(
      ProductListFetch event, Emitter<ProductListState> emit) async {
    if (state.hasReachedMax) return;

    emit(state.copyWith(
      status: ProductListStatus.isLoading,
    ));
    try {
      final products = await _productRepository.getProductList(event.userId);
      emit(state.copyWith(
          status: ProductListStatus.success, products: products));
    } catch (e) {
      emit(state.copyWith(status: ProductListStatus.failure));
    }
  }

  void _changeProduct(ChangeProduct event, Emitter<ProductListState> emit) {
    emit(state.copyWith(
        status: ProductListStatus.success,
        products: state.products.map((product) {
          return product.id == event.productId
              ? product.copyWith(
                  id: product.id,
                  isFavorite: event.isFavorite,
                  inCart: event.inCart)
              : product;
        }).toList()));
  }

  // // Todo refactor
  // Future<void> _onChangeProductFavorite(
  //     ChangeProductFavorite event, Emitter<ProductListState> emit) async {
  //   final prevState = state;
  //   try {
  //     bool prevIsFavorite = false;
  //     emit(state.copyWith(
  //       status: ProductListStatus.success,
  //       products: state.products.map((product) {
  //         if (event.productId == product.id) {
  //           prevIsFavorite = product.isFavorite;
  //           return product.copyWith(
  //               id: product.id, isFavorite: !prevIsFavorite);
  //         }
  //         return product;
  //       }).toList(),
  //     ));
  //     if (!prevIsFavorite) {
  //       await _favoriteRepository.addFavorite(event.userId, event.productId);
  //     } else {
  //       await _favoriteRepository.removeFavorite(event.userId, event.productId);
  //       //
  //     }
  //   } catch (e) {
  //     print(e);
  //     // rollback prev state;
  //     emit(prevState.copyWith());
  //   }
  // }

  // // Todo refactor
  // Future<void> _onAddToCart(
  //     AddProductToCart event, Emitter<ProductListState> emit) async {
  //   final prevState = state;
  //   try {
  //     bool prevInCart = false;
  //     emit(state.copyWith(
  //       status: ProductListStatus.success,
  //       products: state.products.map((product) {
  //         if (event.productId == product.id) {
  //           prevInCart = product.inCart;
  //           return product.copyWith(id: product.id, inCart: !prevInCart);
  //         }
  //         return product;
  //       }).toList(),
  //     ));
  //     if (!prevInCart) {
  //       await _cartRepository.addToCart(event.userId, event.productId);
  //     } else {
  //       await _cartRepository.removeFromCart(event.userId, event.productId);
  //       //
  //     }
  //   } catch (e) {
  //     print(e);
  //     // rollback prev state;
  //     emit(prevState.copyWith());
  //   }
  // }

  @override
  ProductListState fromJson(Map<String, dynamic> json) {
    return ProductListState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ProductListState state) {
    return state.toJson();
  }
}
