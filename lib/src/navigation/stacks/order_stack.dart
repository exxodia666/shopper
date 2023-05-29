import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/src/navigation/header.dart';
import 'package:shopper/src/navigation/routes.dart';
import 'package:shopper/src/navigation/scaffold.dart';
import 'package:shopper/src/screens/Cart/cart.dart';
import 'package:shopper/src/screens/Order/order.dart';
import 'package:shopper/src/widgets/bottom_bar/bottom_bar.dart';

GoRoute orderStack = GoRoute(
  path: Routes.cart,
  builder: (BuildContext context, GoRouterState state) {
    return CustomScaffold(
        header: CustomHeader(
          title: 'Cart',
          backBtn: false,
        ),
        bottomAppBar: BottomBar(
          selectedRoute: GoRouter.of(context).location,
        ),
        child: const Cart()
    );
  },
  routes: <RouteBase>[
    GoRoute(
      path: Routes.order,
      builder: (BuildContext context, GoRouterState state) {
        return const Order();
      },
    ),
  ],
);
