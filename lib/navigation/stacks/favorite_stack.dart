import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/bloc/favorite/favorite_bloc.dart';
import 'package:shopper/bloc/product_list/product_list_bloc.dart';
import 'package:shopper/navigation/header.dart';
import 'package:shopper/navigation/main_navigator.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/navigation/scaffold.dart';
import 'package:shopper/repository/favorite_repository.dart';
import 'package:shopper/screens/Favourites/favorites.dart';
import 'package:shopper/screens/product_details/product_details.dart';
import 'package:shopper/theme/colors.dart';

final GlobalKey<NavigatorState> _favoriteShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'favorite_shell');

StatefulShellBranch favoriteBranch = StatefulShellBranch(
  navigatorKey: _favoriteShellNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.favorites,
      pageBuilder: (context, state) => NoTransitionPage(
          child: CustomScaffold(
        header: CustomHeader(
          title: 'Favorites',
          backBtn: false,
        ),
        child: const Favorites(),
        // header: AppBar(),
      )),
      routes: [
        GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: '${Routes.details}/:id',
          builder: (BuildContext context, GoRouterState state) {
            return CustomScaffold(
              header: CustomHeader(
                actions: [
                  BlocBuilder<ProductListBloc, ProductListState>(
                    builder: (context, blocState) {
                      final id = state.pathParameters['id'] ?? '';
                      final user = context.read<AppBloc>().state.user;
                      final filtered = blocState.getFilteredProductById(id);
                      final isFavorite =
                          filtered.isEmpty ? false : filtered[0].isFavorite;
                      return InkWell(
                          onTap: () {
                            context.read<FavoriteBloc>().add(isFavorite
                                ? RemoveFromFavorite(
                                    userId: user.id, productId: id)
                                : AddToFavorite(
                                    userId: user.id, productId: id));
                            context
                                .read<ProductListBloc>()
                                .add(ProductListFetch(userId: user.id));
                            context
                                .read<FavoriteBloc>()
                                .add(FavoriteProductFetch(userId: user.id));
                          },
                          child: isFavorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: CustomColors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: CustomColors.black,
                                ));
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              child: ProductDetails(id: state.pathParameters['id'] ?? ''),
            );
          },
        )
      ],
    ),
  ],
);
