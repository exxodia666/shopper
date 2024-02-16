// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartState _$CartStateFromJson(Map<String, dynamic> json) => CartState(
      status: $enumDecodeNullable(_$CartStatusEnumMap, json['status']) ??
          CartStatus.initial,
      cartProducts: (json['cartProducts'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Product>[],
      cartItems: (json['cartItems'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CartItem>[],
    );

Map<String, dynamic> _$CartStateToJson(CartState instance) => <String, dynamic>{
      'status': _$CartStatusEnumMap[instance.status]!,
      'cartProducts': instance.cartProducts,
      'cartItems': instance.cartItems,
    };

const _$CartStatusEnumMap = {
  CartStatus.initial: 'initial',
  CartStatus.success: 'success',
  CartStatus.failure: 'failure',
  CartStatus.isLoading: 'isLoading',
};
