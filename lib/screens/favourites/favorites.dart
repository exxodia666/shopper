import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/bloc/favorite/favorite_bloc.dart';
import 'package:shopper/widgets/widgets.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
      if (state.status == FavoriteStatus.isLoading) {
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
              onDeletePress: () {},
            );
          },
        ),
      ));
    });
  }
}
