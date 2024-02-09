import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/navigation/header.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/navigation/scaffold.dart';
import 'package:shopper/screens/Categories/categories.dart';
import 'package:shopper/screens/Home/home.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/widgets/widgets.dart';
import 'package:shopper/screens/category_products/category_products.dart';
import 'package:shopper/screens/product_details/product_details.dart';

final GlobalKey<NavigatorState> _homeShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home_shell');

GoRoute homeStack = GoRoute(
  path: Routes.home,
  builder: (BuildContext context, GoRouterState state) {
    return CustomScaffold(
      bottomAppBar: BottomBar(
        selectedRoute: GoRouter.of(context).location,
      ),
      header: CustomHeader(
        title: 'Shopper',
        backBtn: false,
      ),
      child: const Home(),
    );
  },
  routes: [
    ShellRoute(
      navigatorKey: _homeShellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return CustomScaffold(
            header: CustomHeader(),
            bottomAppBar: BottomBar(
              selectedRoute: GoRouter.of(context).location,
            ),
            child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: Routes.categoryProducts,
          builder: (BuildContext context, GoRouterState state) {
            return const CategoryProducts();
          },
        ),
      ],
    ),
    ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return CustomScaffold(
            header: CustomHeader(
              actions: [
                InkWell(
                    onTap: () {
                      switchTab(context, Routes.cart);
                    },
                    child: const Icon(
                      Icons.shopping_cart_rounded,
                      color: CustomColors.black,
                    )),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: Routes.categories,
            builder: (BuildContext context, GoRouterState state) {
              return const Categories();
            },
          ),
          GoRoute(
            path: Routes.details,
            builder: (BuildContext context, GoRouterState state) {
              return const ProductDetails();
            },
          ),
        ])
  ],
);
