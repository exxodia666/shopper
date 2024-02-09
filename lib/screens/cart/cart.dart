import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/bloc/cart/cart_bloc.dart';
import 'package:shopper/widgets/widgets.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    var user = context.read<AppBloc>().state.user;
    context.read<CartBloc>().add(CartFetch(userId: user.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state.status == CartStatus.isLoading) {
        const Center(
          child: CupertinoActivityIndicator(
            color: Colors.black,
          ),
        );
      }
      return Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: ProductList(
          items: state.cartProducts,
          renderItem: (item) {
            return CartProductItem(
              item: item,
              onProductPress: () {},
              onDeletePress: () {},
            );
          },
        ),
      ));
    });
  }
}
