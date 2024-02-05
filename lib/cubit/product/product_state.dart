part of 'product_cubit.dart';

enum ProductStatus { initial, loading, success, failure }

// extension WeatherStatusX on WeatherStatus {
//   bool get isInitial => this == WeatherStatus.initial;
//   bool get isLoading => this == WeatherStatus.loading;
//   bool get isSuccess => this == WeatherStatus.success;
//   bool get isFailure => this == WeatherStatus.failure;
// }

@JsonSerializable()
final class ProductsState extends Equatable {
  ProductsState({
    this.status = ProductStatus.initial,
    List<Product>? products,
  }) : products = products ?? [];

  final ProductStatus status;
  final List<Product> products;

  ProductsState copyWith({
    ProductStatus? status,
    List<Product>? products,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? [],
    );
  }

  factory ProductsState.fromJson(Map<String, dynamic> json) =>
      _$ProductsStateFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsStateToJson(this);

  @override
  List<Object?> get props => [];
}
