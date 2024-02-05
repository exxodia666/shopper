import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/navigation/header.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/navigation/scaffold.dart';
import 'package:shopper/screens/Cart/cart.dart';
import 'package:shopper/screens/Order/order.dart';
import 'package:shopper/widgets/widgets.dart';

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
