import 'package:flutter/material.dart';
import 'package:shopper/src/navigation/routes.dart';
import 'package:shopper/src/theme/colors.dart';

class BottomBarButton extends StatelessWidget {
  const BottomBarButton(
      {Key? key,
      required this.selectedRoute,
      required this.route,
      required this.icon})
      : super(key: key);

  final String route;
  final String selectedRoute;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switchTab(context, route);
      },
      child: Icon(
        icon,
        color: selectedRoute == route
            ? CustomColors.primary
            : CustomColors.lightGrey,
      ),
    );
  }
}
