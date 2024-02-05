// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsState _$ProductsStateFromJson(Map<String, dynamic> json) =>
    ProductsState(
      status: $enumDecodeNullable(_$ProductStatusEnumMap, json['status']) ??
          ProductStatus.initial,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsStateToJson(ProductsState instance) =>
    <String, dynamic>{
      'status': _$ProductStatusEnumMap[instance.status]!,
      'products': instance.products,
    };

const _$ProductStatusEnumMap = {
  ProductStatus.initial: 'initial',
  ProductStatus.loading: 'loading',
  ProductStatus.success: 'success',
  ProductStatus.failure: 'failure',
};
