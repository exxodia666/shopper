import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void onProductPress() {
    navigateTo(context, Routes.details);
  }

  void onCartPress(Product item, String userId) {
    context
        .read<ProductListBloc>()
        .add(AddProductToCart(productId: item.id, userId: userId));
    if (!item.inCart) switchTab(context, Routes.cart);
  }

  void onFavoritePress(itemId, userId) {
    // Todo add animation on this
    context
        .read<ProductListBloc>()
        .add(ChangeProductFavorite(productId: itemId, userId: userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
      if (state.status == ProductListStatus.isLoading) {
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
