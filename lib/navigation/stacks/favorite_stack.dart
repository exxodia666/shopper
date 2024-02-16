import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/bloc/favorite/favorite_bloc.dart';
import 'package:shopper/navigation/header.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/navigation/scaffold.dart';
import 'package:shopper/repository/favorite_repository.dart';
import 'package:shopper/screens/Favourites/favorites.dart';
import 'package:shopper/widgets/widgets.dart';

GoRoute favoritesStack = GoRoute(
  path: Routes.favorites,
  builder: (BuildContext context, GoRouterState state) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return CustomScaffold(
      header: CustomHeader(
        title: 'Favourites',
        backBtn: false,
      ),
      bottomAppBar: BottomBar(
        selectedRoute: GoRouter.of(context).location,
      ),
      child: BlocProvider(
        create: (context) => FavoriteBloc(
          context.read<FavoriteRepository>(),
        )..add(FavoriteProductFetch(userId: user.id)),
        child: const Favorites(),
      ),
      // header: AppBar(),
    );
  },
  routes: const <RouteBase>[],
);
