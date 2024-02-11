import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/bloc/cart/cart_bloc.dart';
import 'package:shopper/bloc/favorite/favorite_bloc.dart';
import 'package:shopper/bloc/product_list/product_list_bloc.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getProducts() {
    var user = context.read<AppBloc>().state.user;
    context.read<ProductListBloc>().add(ProductListFetch(userId: user.id));
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void onProductPress() {
    navigateTo(context, Routes.details);
  }

  void onCartPress(Product item, String userId) {
    context.read<CartBloc>().add(item.inCart
        ? RemoveFromCart(productId: item.id, userId: userId)
        : AddToCart(productId: item.id, userId: userId));
    context
        .read<ProductListBloc>()
        .add(ChangeProduct(productId: item.id, inCart: !item.inCart));
    if (!item.inCart) switchTab(context, Routes.cart);
  }

  void onFavoritePress(Product item, userId) {
    // Todo add animation on this
    context.read<FavoriteBloc>().add(!item.isFavorite
        ? AddToFavorite(productId: item.id, userId: userId)
        : RemoveFromFavorite(productId: item.id, userId: userId));
    context
        .read<ProductListBloc>()
        .add(ChangeProduct(productId: item.id, isFavorite: !item.isFavorite));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
      if (state.status == ProductListStatus.initial) {
        return const Center(
          child: CupertinoActivityIndicator(
            color: Colors.black,
          ),
        );
      }
      return Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Stack(
            children: [
              Column(
                children: [
                  GridProductList(
                    items: state.products,
                    onFavoritePress: onFavoritePress,
                    onCartPress: onCartPress,
                    onProductPress: onProductPress,
                  ),
                ],
              ),
            ],
          ),
          // ),
        ),
      );
    });
  }
}

// Change GridProductList top to 60 if there is SearchBar
// Positioned(
//     top: 10,
//     width: MediaQuery.of(context).size.width * 0.9,
//     child: const CustomSearchBar()
// ),
