import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/repository/cart_repository.dart';
import 'package:shopper/repository/product_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

part 'cart_bloc.g.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc(this._cartRepository, this._productRepository)
      : super(const CartState()) {
    on<CartFetch>(_onCartFetch);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
  }

  final CartRepository _cartRepository;
  final ProductRepository _productRepository;

  Future<void> _onCartFetch(CartFetch event, Emitter<CartState> emit) async {
    emit(state.copyWith(
      status: CartStatus.isLoading,
    ));
    try {
      final products = await _cartRepository.fetchCartList(event.userId);

      emit(state.copyWith(status: CartStatus.success, cartProducts: products));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: CartStatus.failure));
    }
  }

  Future<void> _onRemoveFromCart(
      RemoveFromCart event, Emitter<CartState> emit) async {
    emit(state.copyWith(
      status: CartStatus.isLoading,
    ));
    try {
      await _cartRepository.removeFromCart(event.userId, event.productId);
      emit(state.copyWith(
        status: CartStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: CartStatus.failure));
    }
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    emit(state.copyWith(
      status: CartStatus.isLoading,
    ));
    try {
      await _cartRepository.addToCart(event.userId, event.productId);
      emit(state.copyWith(
        status: CartStatus.success,
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: CartStatus.failure));
    }
  }

  @override
  CartState fromJson(Map<String, dynamic> json) {
    return CartState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(CartState state) {
    return state.toJson();
  }
}
