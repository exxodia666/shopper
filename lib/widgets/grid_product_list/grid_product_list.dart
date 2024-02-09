import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/bloc/product_list/product_list_bloc.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/models/models.dart';
import '../grid_product_item/grid_product_item.dart';

class GridProductList extends StatefulWidget {
  const GridProductList({Key? key, required this.items}) : super(key: key);
  final List<Product> items;
  @override
  State<GridProductList> createState() => _GridProductListState();
}

class _GridProductListState extends State<GridProductList> {
  navigate() {
    navigateTo(context, Routes.details);
  }

  @override
  Widget build(BuildContext context) {
    var user = context.select((AppBloc bloc) => bloc.state.user);
    return Expanded(
      child: Padding(
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
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            final item = widget.items[index];
            return GridProductItem(
              item: item,
              isFavorite: item.isFavorite,
              onProductPress: navigate,
              onCartPress: () {
                // Todo add animation on this
                context
                    .read<ProductListBloc>()
                    .add(AddProductToCart(productId: item.id, userId: user.id));
              },
              onFavoritePress: () {
                // Todo add animation on this
                context.read<ProductListBloc>().add(
                    ChangeProductFavorite(productId: item.id, userId: user.id));
              },
            );
          },
        ),
      ),
    );
  }
}
