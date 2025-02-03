import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/models/models.dart';

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
    var user = context.select((AppBloc bloc) => bloc.state.user);
    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
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
                  },
                );
              },
            ),
          ),
          if (isLoading)
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 80,
              // todo custom loader
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
