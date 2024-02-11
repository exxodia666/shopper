import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/bloc/favorite/favorite_bloc.dart';
import 'package:shopper/bloc/product_list/product_list_bloc.dart';
import 'package:shopper/widgets/widgets.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  void initState() {
    var user = context.read<AppBloc>().state.user;
    context.read<FavoriteBloc>().add(FavoriteProductFetch(userId: user.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.select((AppBloc bloc) => bloc.state.user);
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
      if (state.status == FavoriteStatus.initial) {
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
          items: state.favoriteProducts,
          renderItem: (item) {
            return FavoriteProductItem(
              item: item,
              onProductPress: () {},
              onDeletePress: () {
                context.read<FavoriteBloc>().add(
                    RemoveFromFavorite(productId: item.id, userId: user.id));
                context
                    .read<FavoriteBloc>()
                    .add(FavoriteProductFetch(userId: user.id));

                context.read<ProductListBloc>().add(ChangeProduct(
                    productId: item.id, isFavorite: !item.isFavorite));
              },
            );
          },
        ),
      ));
    });
  }
}
