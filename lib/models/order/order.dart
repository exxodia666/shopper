import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

enum OrderStatuses {
  pending,
  accepted,
  declined,
  cancelled,
  awaitingShipment,
  awaitingPickup,
  done
}

extension OrderStatusesExtension on OrderStatuses {
  String get value {
    switch (this) {
      case OrderStatuses.pending:
        return 'pending';
      case OrderStatuses.accepted:
        return 'accepted';
      case OrderStatuses.declined:
        return 'declined';
      case OrderStatuses.cancelled:
        return 'cancelled';
      case OrderStatuses.awaitingShipment:
        return 'awaitingShipment';
      case OrderStatuses.awaitingPickup:
        return 'awaitingPickup';
      case OrderStatuses.done:
        return 'done';
    }
  }
}

@JsonSerializable()
class OrderItem extends Equatable {
  const OrderItem(
      {required this.id,
      required this.userId,
      this.status = OrderStatuses.pending,
      required this.total});

  final String id;
  final String userId;
  final OrderStatuses status;
  final double total;

  OrderItem copyWith({String? userId, OrderStatuses? status, double? total}) {
    return OrderItem(
      id: id,
      userId: userId ?? this.userId,
      total: total ?? this.total,
      status: status ?? this.status,
    );
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  @override
  List<Object?> get props => [userId, status, total];
}
