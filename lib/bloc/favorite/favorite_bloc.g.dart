// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteState _$FavoriteStateFromJson(Map<String, dynamic> json) =>
    FavoriteState(
      status: $enumDecodeNullable(_$FavoriteStatusEnumMap, json['status']) ??
          FavoriteStatus.initial,
      favoriteProducts: (json['favoriteProducts'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Product>[],
    );

Map<String, dynamic> _$FavoriteStateToJson(FavoriteState instance) =>
    <String, dynamic>{
      'status': _$FavoriteStatusEnumMap[instance.status]!,
      'favoriteProducts': instance.favoriteProducts,
    };

const _$FavoriteStatusEnumMap = {
  FavoriteStatus.initial: 'initial',
  FavoriteStatus.success: 'success',
  FavoriteStatus.failure: 'failure',
  FavoriteStatus.isLoading: 'isLoading',
};
