import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/repository/order_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

part 'order_bloc.g.dart';

class OrderBloc extends HydratedBloc<OrderEvent, OrderState> {
  OrderBloc(this._orderRepository) : super(const OrderState()) {
    on<OrderFetch>(_onOrderFetch);
    on<CreateOrder>(_createOrder);
    on<CancellOrder>(_cancellOrder);
  }

  final OrderRepository _orderRepository;

  Future<void> _onOrderFetch(OrderFetch event, Emitter<OrderState> emit) async {
    try {
      final response = await _orderRepository.fetchOrders(event.userId);
      emit(state.copyWith(orderItems: response));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _cancellOrder(
      CancellOrder event, Emitter<OrderState> emit) async {
    final prevState = state.copyWith();
    try {
      emit(state.copyWith(
          orderItems: state.orderItems
              .map((e) => e.id == event.id
                  ? e.copyWith(status: OrderStatuses.cancelled)
                  : e.copyWith())
              .toList()));
      await _orderRepository.cancellOrder(event.id);
    } catch (e) {
      emit(prevState);
      print(e);
    }
  }

  Future<void> _createOrder(CreateOrder event, Emitter<OrderState> emit) async {
    try {
      await _orderRepository.createOrder(event.userId, event.cartItems);
    } catch (e) {
      print(e);
    }
  }

  @override
  OrderState fromJson(Map<String, dynamic> json) {
    return OrderState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(OrderState state) {
    return state.toJson();
  }
}
