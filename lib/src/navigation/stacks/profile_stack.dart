import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/authentication/authentication.dart';
import 'package:shopper/src/navigation/header.dart';
import 'package:shopper/src/navigation/routes.dart';
import 'package:shopper/src/navigation/scaffold.dart';
import 'package:shopper/src/screens/profile_page/profile_page.dart';
import 'package:shopper/src/theme/colors.dart';
import 'package:shopper/src/widgets/bottom_bar/bottom_bar.dart';

final GlobalKey<NavigatorState> _homeShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'profile_shell');

GoRoute profileStack = GoRoute(
  path: Routes.profile,
  builder: (BuildContext context, GoRouterState state) {
    var authRepository = context.read<AuthenticationRepository>();
    return BlocProvider(
      create: (_) => AppBloc(authenticationRepository: authRepository),
      child: CustomScaffold(
          bottomAppBar: BottomBar(
            selectedRoute: GoRouter.of(context).location,
          ),
          header: CustomHeader(
            title: 'Profile',
            backBtn: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                  // key: const Key('ProfilePage_logout_iconButton'),
                  child: const Icon(
                    Icons.exit_to_app,
                    color: CustomColors.black,
                  ),
                  onTap: () {
                    context.read<AppBloc>().add(const AppLogoutRequested());
                  },
                ),
              )
            ],
          ),
          child: const ProfilePage()),
    );
  },
  routes: [
    // ShellRoute(
    //   navigatorKey: _homeShellNavigatorKey,
    //   builder: (BuildContext context, GoRouterState state, Widget child) {
    //     return CustomScaffold(
    //         header: CustomHeader(),
    //         bottomAppBar: BottomBar(
    //           selectedRoute: GoRouter.of(context).location,
    //         ),
    //         child: child);
    //   },
    //   routes: <RouteBase>[
    //     GoRoute(
    //       path: Routes.categoryProducts,
    //       builder: (BuildContext context, GoRouterState state) {
    //         return const CategoryProducts();
    //       },
    //     ),
    //   ],
    // ),
    // ShellRoute(
    //     builder: (BuildContext context, GoRouterState state, Widget child) {
    //       return CustomScaffold(
    //         header: CustomHeader(
    //           actions: [
    //             InkWell(
    //                 onTap: () {
    //                   switchTab(context, Routes.cart);
    //                 },
    //                 child: const Icon(
    //                   Icons.shopping_cart_rounded,
    //                   color: CustomColors.black,
    //                 )),
    //             const SizedBox(
    //               width: 20,
    //             ),
    //           ],
    //         ),
    //         child: child,
    //       );
    //     },
    //     routes: [
    //       GoRoute(
    //         path: Routes.categories,
    //         builder: (BuildContext context, GoRouterState state) {
    //           return const Categories();
    //         },
    //       ),
    //       GoRoute(
    //         path: Routes.details,
    //         builder: (BuildContext context, GoRouterState state) {
    //           return const ProductDetails();
    //         },
    //       ),
    //     ])
  ],
);
