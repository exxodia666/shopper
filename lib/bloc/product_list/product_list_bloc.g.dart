// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListState _$ProductListStateFromJson(Map<String, dynamic> json) =>
    ProductListState(
      status: $enumDecodeNullable(_$ProductListStatusEnumMap, json['status']) ??
          ProductListStatus.initial,
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Product>[],
      hasReachedMax: json['hasReachedMax'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductListStateToJson(ProductListState instance) =>
    <String, dynamic>{
      'status': _$ProductListStatusEnumMap[instance.status]!,
      'products': instance.products,
      'hasReachedMax': instance.hasReachedMax,
    };

const _$ProductListStatusEnumMap = {
  ProductListStatus.initial: 'initial',
  ProductListStatus.success: 'success',
  ProductListStatus.failure: 'failure',
  ProductListStatus.isLoading: 'isLoading',
};
