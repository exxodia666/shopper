import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

part 'cart_bloc.g.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc(this._cartRepository) : super(const CartState()) {
    on<CartFetch>(_onCartFetch);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);

    on<ChangeCartItemCount>(_changeItemCount);

    on<ClearCart>(_clearCart);
  }

  final CartRepository _cartRepository;

  Future<void> _onCartFetch(CartFetch event, Emitter<CartState> emit) async {
    emit(state.copyWith(
      status: CartStatus.isLoading,
    ));
    try {
      final response = await _cartRepository.fetchCartList(event.userId);
      emit(state.copyWith(
          status: CartStatus.success,
          cartProducts: response.products,
          cartItems: response.cartItems));
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

  void _changeItemCount(
      ChangeCartItemCount event, Emitter<CartState> emit) async {
    try {
      int count = 0;
      var newItems = state.cartItems.map((e) {
        if (e.productId == event.productId) {
          count = event.dir == Dir.incr ? e.count + 1 : max(e.count - 1, 1);
          return e.copyWith(count: count);
        }
        return e.copyWith();
      }).toList();
      emit(state.copyWith(cartItems: newItems));
      await _cartRepository.changeCartItemCount(
          event.userId, event.productId, count);
    } catch (e) {
      print(e);
      emit(state.copyWith());
    }
  }

  void _clearCart(ClearCart event, Emitter<CartState> emit) async {
    try {
      await _cartRepository.clearCart(event.userId);
      emit(state.copyWith(cartItems: [], cartProducts: []));
    } catch (e) {
      print(e);
      emit(state.copyWith());
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
