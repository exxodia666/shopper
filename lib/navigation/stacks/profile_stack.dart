import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/navigation/header.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/navigation/scaffold.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/widgets/widgets.dart';
import 'package:shopper/screens/profile_page/profile_page.dart';

final GlobalKey<NavigatorState> _profileShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'profile_shell');

StatefulShellBranch profileBranch = StatefulShellBranch(
  navigatorKey: _profileShellNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.profile,
      pageBuilder: (context, state) => NoTransitionPage(
        child: CustomScaffold(
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
      ),
      routes: const [
        // GoRoute(
        //   path: 'details',
        //   builder: (context, state) => const DetailsScreen(label: 'A'),
        // ),
      ],
    ),
  ],
);
