part of 'product_list_bloc.dart';

enum ProductListStatus { initial, success, failure, isLoading }

@JsonSerializable()
final class ProductListState extends Equatable {
  const ProductListState({
    this.status = ProductListStatus.initial,
    this.products = const <Product>[],
    this.hasReachedMax = false,
  });

  final ProductListStatus status;
  final List<Product> products;
  final bool hasReachedMax;

  ProductListState copyWith({
    ProductListStatus? status,
    List<Product>? products,
    bool? hasReachedMax,
  }) {
    return ProductListState(
      status: status ?? this.status,
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  List<Product> getFilteredProductById(String id) {
    return products.where((element) => element.id == id).toList();
  }

  factory ProductListState.fromJson(Map<String, dynamic> json) =>
      _$ProductListStateFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListStateToJson(this);

  @override
  String toString() {
    return '''ProductListState { status: $status, hasReachedMax: $hasReachedMax, posts: ${products.length} }''';
  }

  @override
  List<Object> get props => [status, products, hasReachedMax];
}
