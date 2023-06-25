import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/src/navigation/routes.dart';
import '../../../authentication/view/view.dart';

GoRoute authStack = GoRoute(
  path: Routes.signIn,
  builder: (BuildContext context, GoRouterState state) {
    return const SignInPage();
  },
  routes: <RouteBase>[
    GoRoute(
      path: Routes.signUp,
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpPage();
      },
    ),
  ],
);
