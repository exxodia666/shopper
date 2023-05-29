import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/src/navigation/routes.dart';
import 'package:shopper/src/navigation/stacks/auth_stack.dart';
import 'package:shopper/src/navigation/stacks/favorite_stack.dart';
import 'package:shopper/src/navigation/stacks/home_stack.dart';
import 'package:shopper/src/navigation/stacks/order_stack.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
// final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final GlobalKey<NavigatorState> _authNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'auth');

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);
  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final auth = true;
  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      /// The first screen to display in the bottom navigation bar.
      homeStack,
      /// Displayed when the second item in the the bottom navigation bar is selected.
      favoritesStack,
      /// The third screen to display in the bottom nwavigation bar.
      orderStack,
    ],
  );

  final GoRouter _authRouter = GoRouter(
      navigatorKey: _authNavigatorKey,
      initialLocation: Routes.signIn,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        authStack,
      ]
  );

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(Routes.home);
    }
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: !auth ? _authRouter : _router,
      // routes: {
      //   '/': (context) => SignIn(),
      //   '/signUp': (context) => SignUp(),
      //   '/home': (context) => Home(),
      // },
      // home: const SignIn(),
    );
  }
}