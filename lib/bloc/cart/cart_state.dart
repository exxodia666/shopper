part of 'cart_bloc.dart';

enum CartStatus { initial, success, failure, isLoading }

@JsonSerializable()
final class CartState extends Equatable {
  const CartState({
    this.status = CartStatus.initial,
    this.cartProducts = const <Product>[],
  });

  final CartStatus status;
  final List<Product> cartProducts;

  CartState copyWith({
    CartStatus? status,
    List<Product>? cartProducts,
    bool? hasReachedMax,
  }) {
    return CartState(
      status: status ?? this.status,
      cartProducts: cartProducts ?? this.cartProducts,
    );
  }

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);

  Map<String, dynamic> toJson() => _$CartStateToJson(this);

  @override
  List<Object> get props => [status, cartProducts];
}
