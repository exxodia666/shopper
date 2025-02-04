import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/bloc/cart/cart_bloc.dart';
import 'package:shopper/bloc/favorite/favorite_bloc.dart';
import 'package:shopper/bloc/order/order_bloc.dart';
import 'package:shopper/bloc/product_list/product_list_bloc.dart';
import 'package:shopper/cubit/cart_product_count/cart_product_count_cubit.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/navigation/scaffold.dart';
import 'package:shopper/navigation/stacks/auth_stack.dart';
import 'package:shopper/navigation/stacks/favorite_stack.dart';
import 'package:shopper/navigation/stacks/home_stack.dart';
import 'package:shopper/navigation/stacks/profile_stack.dart';
// import 'package:shopper/navigation/stacks/favorite_stack.dart';
// import 'package:shopper/navigation/stacks/home_stack.dart';
// import 'package:shopper/navigation/stacks/order_stack.dart';
// import 'package:shopper/navigation/stacks/profile_stack.dart';
import 'package:shopper/repository/cart_repository.dart';
import 'package:shopper/repository/favorite_repository.dart';
import 'package:shopper/repository/order_repository.dart';
import 'package:shopper/repository/product_repository.dart';
import 'package:shopper/widgets/bottom_bar/bottom_bar.dart';

import 'stacks/order_stack.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

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
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            void goBranch(int index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            }

            return CustomScaffold(
              bottomAppBar: BottomBar(
                selectedIndex: navigationShell.currentIndex,
                setSelectedIndex: goBranch,
              ),
              child: navigationShell,
            );
          },
          branches: [homeBranch, favoriteBranch, orderBranch, profileBranch])
    ],
  );

  final GoRouter _authRouter = GoRouter(
      navigatorKey: _authNavigatorKey,
      initialLocation: Routes.signIn,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        authStack,
      ]);

  @override
  Widget build(BuildContext context) {
    var authStatus = context.select((AppBloc bloc) => bloc.state.status);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteBloc(
            context.read<FavoriteRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => ProductListBloc(
            context.read<ProductRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => CartBloc(
            context.read<CartRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => OrderBloc(
            context.read<OrderRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => CartProdCountCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Shopper',
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('uk'), // Ukrainian
        ],
        theme: ThemeData(),
        routerConfig:
            authStatus == AppStatus.unauthenticated ? _authRouter : _router,
        // routes: {
        //   '/': (context) => SignIn(),
        //   '/signUp': (context) => SignUp(),
        //   '/home': (context) => Home(),
        // },
        // home: const SignIn(),
      ),
    );
  }
}
