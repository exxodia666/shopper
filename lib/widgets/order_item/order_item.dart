import 'package:flutter/material.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/typography.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem(
      {super.key, required this.item, required this.onCancellPress});
  final OrderItem item;
  final Function onCancellPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
                color: CustomColors.primaryShadow,
                spreadRadius: 0.1,
                blurRadius: 0.1)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypographyCustom.medium(
                    text: '${item.total.toString()} Rs.',
                    color: CustomColors.black,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      TypographyCustom.medium(
                        text: 'Status: ',
                        color: CustomColors.placeholder,
                        fontSize: 18,
                      ),
                      TypographyCustom.medium(
                        text: item.status.value,
                        color: CustomColors.primary,
                        fontSize: 18,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    customBorder:
                        Border.all(color: CustomColors.black, width: 1),
                    onTap: () {
                      onCancellPress();
                    },
                    child: const Icon(Icons.cancel_outlined),
                  ),
                  // Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
