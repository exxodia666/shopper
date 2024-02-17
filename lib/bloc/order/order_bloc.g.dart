// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderState _$OrderStateFromJson(Map<String, dynamic> json) => OrderState(
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
          OrderStatus.initial,
      orderItems: (json['orderItems'] as List<dynamic>?)
              ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <OrderItem>[],
    );

Map<String, dynamic> _$OrderStateToJson(OrderState instance) =>
    <String, dynamic>{
      'status': _$OrderStatusEnumMap[instance.status]!,
      'orderItems': instance.orderItems,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.initial: 'initial',
  OrderStatus.success: 'success',
  OrderStatus.failure: 'failure',
  OrderStatus.isLoading: 'isLoading',
};
