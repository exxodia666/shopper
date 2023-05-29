import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/src/navigation/header.dart';
import 'package:shopper/src/navigation/routes.dart';
import 'package:shopper/src/navigation/scaffold.dart';
import 'package:shopper/src/screens/Favourites/favorites.dart';
import 'package:shopper/src/widgets/bottom_bar/bottom_bar.dart';

GoRoute favoritesStack = GoRoute(
  path: Routes.favorites,
  builder: (BuildContext context, GoRouterState state) {
    return CustomScaffold(
      header: CustomHeader(
        title: 'Favourites',
        backBtn: false,
      ),
      bottomAppBar: BottomBar(
        selectedRoute: GoRouter.of(context).location,
      ),
      child: Favorites(),
      // header: AppBar(),
    );
  },
  routes: const <RouteBase>[],
);
