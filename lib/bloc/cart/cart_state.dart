part of 'cart_bloc.dart';

enum CartStatus { initial, success, failure, isLoading }

@JsonSerializable()
final class CartState extends Equatable {
  const CartState({
    this.status = CartStatus.initial,
    this.cartProducts = const <Product>[],
    this.cartItems = const <CartItem>[],
  });

  final CartStatus status;
  final List<Product> cartProducts;
  final List<CartItem> cartItems;

  CartState copyWith(
      {CartStatus? status,
      List<Product>? cartProducts,
      bool? hasReachedMax,
      List<CartItem>? cartItems}) {
    return CartState(
      status: status ?? this.status,
      cartProducts: cartProducts ?? this.cartProducts,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);

  Map<String, dynamic> toJson() => _$CartStateToJson(this);

  @override
  List<Object> get props => [status, cartProducts, cartItems];
}
