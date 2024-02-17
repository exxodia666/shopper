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

  final double shippingPrice = 100;

  double get cartTotalPrice {
    if (cartItems.isEmpty) return 0.0;
    final cartPrices = cartProducts.map((e) {
      final count = cartItems
          .where((element) => e.id == element.productId)
          .toList()[0]
          .count;
      return count * e.price;
    });
    double total = cartPrices.reduce((value, element) => value + element);
    return total;
  }

  int get cartTotalCount {
    int count = 1;
    var elements = cartItems.map((e) => e.count).toList();
    if (elements.isEmpty) return 0;
    elements.reduce((value, element) => value + element);
    return count;
  }

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);

  Map<String, dynamic> toJson() => _$CartStateToJson(this);

  @override
  List<Object> get props =>
      [status, cartProducts, cartItems, cartTotalCount, cartTotalPrice];
}
