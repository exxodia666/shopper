import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopper/src/theme/colors.dart';
import 'package:shopper/src/theme/fonts.dart';

class Rating extends StatelessWidget {
  final int rating;

  const Rating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 36,
      // decoration: const BoxDecoration(color: CustomColors.lightGrey),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${rating.toString()}/5',
              style: const TextStyle(
                  // backgroundColor: Colors.red,
                  letterSpacing: -1,
                  color: CustomColors.primary,
                  fontFamily: Fonts.semibold,
                  fontSize: 18),
            ),
            const Icon(
              Icons.star_rounded,
              color: CustomColors.primary,
              size: 26,
            )
          ]),
    );
  }
}
