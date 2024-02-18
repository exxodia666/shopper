import 'package:flutter/material.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/theme/colors.dart';

import '../bottom_bar_button/bottom_bar_button.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key, required this.selectedRoute}) : super(key: key);

  final String selectedRoute;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> buildList(String selectedRoute) {
    return [
      BottomBarButton(
        selectedRoute: selectedRoute,
        route: Routes.home,
        icon: Icons.home,
      ),
      BottomBarButton(
        selectedRoute: selectedRoute,
        route: Routes.favorites,
        icon: Icons.favorite_outline_rounded,
      ),
      BottomBarButton(
        selectedRoute: selectedRoute,
        route: Routes.cart,
        icon: Icons.shopping_cart_rounded,
      ),
      BottomBarButton(
        selectedRoute: selectedRoute,
        route: Routes.profile,
        icon: Icons.person_4_outlined,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: CustomColors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        alignment: Alignment.center,
        height: 78,
        decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(44.0),
            boxShadow: const [
              BoxShadow(
                  color: CustomColors.primaryShadow,
                  spreadRadius: 0.1,
                  blurRadius: 0.1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildList(widget.selectedRoute),
        ),
      ),
    );
  }
}
