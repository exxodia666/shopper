import 'package:flutter/material.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/fonts.dart';

class Rating extends StatelessWidget {
  final int rating;

  const Rating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 36,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${rating.toString()}/5',
              style: const TextStyle(
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
