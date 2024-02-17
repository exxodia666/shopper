part of 'order_bloc.dart';

enum OrderStatus { initial, success, failure, isLoading }

@JsonSerializable()
final class OrderState extends Equatable {
  const OrderState({
    this.status = OrderStatus.initial,
    this.orderItems = const <OrderItem>[],
  });

  final OrderStatus status;
  final List<OrderItem> orderItems;

  OrderState copyWith({OrderStatus? status, List<OrderItem>? orderItems}) {
    return OrderState(
      status: status ?? this.status,
      orderItems: orderItems ?? this.orderItems,
    );
  }

  factory OrderState.fromJson(Map<String, dynamic> json) =>
      _$OrderStateFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStateToJson(this);

  @override
  List<Object> get props => [status, orderItems];
}
