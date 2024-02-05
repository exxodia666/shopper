part of 'product_list_bloc.dart';

sealed class ProductListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProductListFetch extends ProductListEvent {}
