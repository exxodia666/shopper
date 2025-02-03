import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/bloc/cart/cart_bloc.dart';
import 'package:shopper/bloc/order/order_bloc.dart';
import 'package:shopper/bloc/product_list/product_list_bloc.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/widgets/widgets.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String currentLocation = GoRouter.of(context).location;
    if (currentLocation == Routes.cart) {
      fetchCart();
    }
  }

  void fetchCart() {
    var user = context.read<AppBloc>().state.user;
    context.read<CartBloc>().add(CartFetch(userId: user.id));
  }

  void onProductPress(String id) {
    navigateTo(context, Routes.details, id: id);
  }

  @override
  Widget build(BuildContext context) {
    var user = context.select((AppBloc bloc) => bloc.state.user);
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state.status == CartStatus.isLoading) {
        const Center(
          child: CircularProgressIndicator(
            color: CustomColors.primary,
          ),
        );
      }
      return Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Stack(
          children: [
            ProductList(
              items: state.cartProducts,
              renderItem: (item) {
                final count = state.cartItems
                        .firstWhereOrNull(
                            (element) => element.productId == item.id)
                        ?.count ??
                    0;
                return CartProductItem(
                  item: item,
                  count: count,
                  onProductPress: () {
                    onProductPress(item.id);
                  },
                  onDecrement: () {
                    context.read<CartBloc>().add(ChangeCartItemCount(
                        userId: user.id, productId: item.id, dir: Dir.decr));
                  },
                  onIncrement: () {
                    context.read<CartBloc>().add(ChangeCartItemCount(
                        userId: user.id, productId: item.id, dir: Dir.incr));
                  },
                  onDeletePress: () {
                    context.read<CartBloc>().add(
                        RemoveFromCart(productId: item.id, userId: user.id));
                    context.read<CartBloc>().add(CartFetch(userId: user.id));
                    context.read<ProductListBloc>().add(ChangeProduct(
                        productId: item.id, inCart: !item.inCart));
                  },
                );
              },
            ),
            CartTotal(
              count: state.cartTotalCount,
              total: state.shippingPrice + state.cartTotalPrice,
              subtotal: state.cartTotalPrice,
              shipping: state.shippingPrice,
              onCheckout: () {
                context.read<OrderBloc>().add(CreateOrder(
                    userId: user.id,
                    cartItems: state.cartItems,
                    total: state.shippingPrice + state.cartTotalPrice));
                context.read<CartBloc>().add(ClearCart(userId: user.id));
              },
            ),
          ],
        ),
      ));
    });
  }
}
