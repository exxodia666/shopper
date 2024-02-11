import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: constant_identifier_names
const MAX_CART_PROD_COUNT = 99;
// ignore: constant_identifier_names
const MIN_CART_PROD_COUNT = 1;

class CartProdCountCubit extends Cubit<int> {
  CartProdCountCubit() : super(1);

  increment() {
    if (state < MAX_CART_PROD_COUNT) emit(state + 1);
  }

  decrement() {
    if (state >= MIN_CART_PROD_COUNT) emit(state - 1);
  }

  reset() {
    emit(MIN_CART_PROD_COUNT);
  }
}
