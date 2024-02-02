import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/navigation/header.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/navigation/scaffold.dart';
import 'package:shopper/screens/Favourites/favorites.dart';
import 'package:shopper/widgets/widgets.dart';

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
