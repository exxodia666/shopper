import 'package:flutter/cupertino.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/typography.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: CustomColors.primary,
          borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.only(top: 28, left: 24),
        child: TypographyCustom.medium(
            text: 'women',
            color: CustomColors.white,
            fontSize: 26,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
