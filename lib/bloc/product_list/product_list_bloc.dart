import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/repository/product_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';
part 'product_list_bloc.g.dart';

class ProductListBloc extends HydratedBloc<ProductListEvent, ProductListState> {
  ProductListBloc(this._productRepository) : super(const ProductListState()) {
    on<ProductListFetch>(_onProductListFetch);
  }

  final ProductRepository _productRepository;

  Future<void> _onProductListFetch(
      ProductListFetch event, Emitter<ProductListState> emit) async {
    if (state.hasReachedMax) return;

    emit(state.copyWith(
      status: ProductListStatus.isLoading,
    ));

    try {
      // if (state.status == ProductListStatus.initial) {
      //   final posts = await _fetchPosts();
      //   return emit(state.copyWith(
      //     status: ProductListStatus.success,
      //     posts: posts,
      //     hasReachedMax: false,
      //   ));
      // }
      final products = await _productRepository.getProduct();
      emit(state.copyWith(
        status: ProductListStatus.success,
        products: products,
      ));
      // emit(products.isEmpty
      //     ? state.copyWith(hasReachedMax: true)
      //     : state.copyWith(
      //         status: ProductListStatus.success,
      //         posts: List.of(state.products)..addAll(products),
      //         hasReachedMax: false,
      //       ));
    } catch (_) {
      emit(state.copyWith(status: ProductListStatus.failure));
    }
  }

  @override
  ProductListState fromJson(Map<String, dynamic> json) {
    return ProductListState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ProductListState state) {
    return state.toJson();
  }
}
