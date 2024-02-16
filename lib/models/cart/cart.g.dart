// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      userId: json['userId'] as String,
      productId: json['productId'] as String,
      count: json['count'] as int? ?? 1,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'userId': instance.userId,
      'productId': instance.productId,
      'count': instance.count,
    };
