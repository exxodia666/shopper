import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/src/navigation/routes.dart';
import 'package:shopper/src/screens/sign_in/sign_in.dart';
import 'package:shopper/src/screens/sign_up/sign_up.dart';

GoRoute authStack = GoRoute(
  path: Routes.signIn,
  builder: (BuildContext context, GoRouterState state) {
    return const SignIn();
  },
  routes: <RouteBase>[
    GoRoute(
      path: Routes.signUp,
      builder: (BuildContext context, GoRouterState state) {
        return const SignUp();
      },
    ),
  ],
);
