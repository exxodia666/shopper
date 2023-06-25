import 'package:flutter/material.dart';
import 'package:shopper/src/navigation/routes.dart';
import 'package:shopper/src/theme/colors.dart';
import 'package:shopper/src/theme/typography.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  bool backBtn = true;
  final String? title;
  final List<Widget>? actions;

  CustomHeader({Key? key, this.backBtn = true, this.title, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: CustomColors.white,
      leading: backBtn
          ? InkWell(
              onTap: () {
                goBack(context);
              },
              child: const Icon(Icons.arrow_back, color: CustomColors.black))
          : const SizedBox(),
      title: title != null
          ? TypographyCustom.regular(
              text: title!,
              color: CustomColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600)
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
