import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/models/models.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../grid_product_item/grid_product_item.dart';

class GridProductList extends StatelessWidget {
  const GridProductList(
      {Key? key,
      required this.isLoading,
      required this.items,
      required this.onFavoritePress,
      required this.onCartPress,
      required this.onProductPress})
      : super(key: key);
  final bool isLoading;
  final List<Product> items;
  final Function(Product, String) onFavoritePress;
  final Function(Product, String) onCartPress;
  final Function onProductPress;

  @override
  Widget build(BuildContext context) {
    //todo remove this
    var user = context.select((AppBloc bloc) => bloc.state.user);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Skeletonizer(
          enabled: isLoading,
          child: GridView.builder(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              bottom: 120,
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3.1 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GridProductItem(
                item: item,
                onProductPress: () {
                  onProductPress(item.id);
                },
                onCartPress: () {
                  onCartPress(item, user.id);
                },
                onFavoritePress: () {
                  onFavoritePress(item, user.id);
                  // Todo add animation on this
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

// showDialog(
                //     context: context,
                //     builder: (context) => BlocBuilder<CartProdCountCubit, int>(
                //           builder: (context, state) {
                //             return AddToCartModal(
                //                 item: item,
                //                 counter: state,
                //                 reset: context.read<CartProdCountCubit>().reset,
                //                 increment: context
                //                     .read<CartProdCountCubit>()
                //                     .increment,
                //                 decrement: context
                //                     .read<CartProdCountCubit>()
                //                     .decrement);
                //           },
                //         ));