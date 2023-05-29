import 'package:flutter/material.dart';
import 'package:shopper/src/navigation/routes.dart';
import 'package:shopper/src/theme/colors.dart';

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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        alignment: Alignment.center,
        height: 78,
        decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(44.0),
            boxShadow: const [
              BoxShadow(
                  //TODO Move to colors
                  color: Color.fromRGBO(12, 26, 75, 0.24),
                  spreadRadius: 0.1,
                  blurRadius: 0.1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //TODO COLORS AND custom icons
          children: buildList(widget.selectedRoute),
        ),
      ),
    );
  }
}
