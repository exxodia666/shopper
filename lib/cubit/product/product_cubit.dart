import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/repository/product_repository.dart';

part 'product_state.dart';
part 'product_cubit.g.dart';

class ProductsCubit extends HydratedCubit<ProductsState> {
  ProductsCubit(this._productRepository) : super(ProductsState());

  final ProductRepository _productRepository;

  Future<void> fetchProducts() async {
    print('start fetching');
    emit(state.copyWith(status: ProductStatus.loading));
    try {
      List<Product> products = await _productRepository.getProduct();
      print('fetched');
      emit(state.copyWith(status: ProductStatus.success, products: products));
      print('start fetching');
    } on Exception {
      if (kDebugMode) {
        print('Error');
      }
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }

  @override
  ProductsState fromJson(Map<String, dynamic> json) =>
      ProductsState.fromJson(json);

  @override
  Map<String, dynamic> toJson(ProductsState state) => state.toJson();
}
