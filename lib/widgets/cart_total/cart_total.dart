import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../theme/colors.dart';
import '../../theme/typography.dart';
import '../button/button.dart';

class CartTotal extends StatelessWidget {
  const CartTotal(
      {Key? key,
      required this.subtotal,
      required this.total,
      required this.shipping,
      required this.count,
      required this.onCheckout})
      : super(key: key);

  final double subtotal;
  final double total;
  final double shipping;
  final int count;

  final Function onCheckout;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 110,
      child: Container(
        color: CustomColors.white,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TypographyCustom.medium(
                          text: AppLocalizations.of(context)!.addCart,
                          color: CustomColors.lightGrey),
                      TypographyCustom.medium(
                          text: 'Rs. $subtotal', color: CustomColors.lightGrey)
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TypographyCustom.medium(
                          text: AppLocalizations.of(context)!.cart_shipping,
                          color: CustomColors.lightGrey),
                      TypographyCustom.medium(
                          text: 'Rs. $shipping', color: CustomColors.lightGrey)
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TypographyCustom.medium(
                          text: AppLocalizations.of(context)!.cart_total,
                          color: CustomColors.black),
                      Row(
                        children: [
                          TypographyCustom.medium(
                              text: '$count item(s)',
                              color: CustomColors.lightGrey),
                          const SizedBox(
                            width: 25.0,
                          ),
                          TypographyCustom.medium(
                              text: 'Rs. $subtotal', color: CustomColors.black)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Button(
                  color: CustomColors.primary,
                  title: AppLocalizations.of(context)!.cart_checkout,
                  textColor: CustomColors.white,
                  onPress: () {
                    onCheckout();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
