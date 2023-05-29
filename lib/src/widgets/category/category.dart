import 'package:flutter/cupertino.dart';
import 'package:shopper/src/theme/colors.dart';

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
      child: const Padding(
        padding: EdgeInsets.only(top: 28, left: 24),
        child: Text(
          'women',
          style: TextStyle(
            letterSpacing: -1,
            color: CustomColors.white,
            fontSize: 26,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
