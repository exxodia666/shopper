// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      userId: json['userId'] as String,
      status: $enumDecodeNullable(_$OrderStatusesEnumMap, json['status']) ??
          OrderStatuses.pending,
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'userId': instance.userId,
      'status': _$OrderStatusesEnumMap[instance.status]!,
      'total': instance.total,
    };

const _$OrderStatusesEnumMap = {
  OrderStatuses.pending: 'pending',
  OrderStatuses.accepted: 'accepted',
  OrderStatuses.declined: 'declined',
  OrderStatuses.cancelled: 'cancelled',
  OrderStatuses.awaitingShipment: 'awaitingShipment',
  OrderStatuses.awaitingPickup: 'awaitingPickup',
  OrderStatuses.done: 'done',
};
