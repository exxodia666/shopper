import 'package:flutter/material.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/fonts.dart';

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
                // TODO Move to colors
                color: Color.fromRGBO(12, 26, 75, 0.24),
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
                  Text(
                    '${item.total.toString()} Rs.',
                    style: const TextStyle(
                        color: CustomColors.black,
                        fontSize: 20,
                        fontFamily: Fonts.medium),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Status: ',
                        style: TextStyle(
                            color: CustomColors.placeholder,
                            fontSize: 18,
                            fontFamily: Fonts.medium),
                      ),
                      Text(
                        item.status.value,
                        style: const TextStyle(
                            color: CustomColors.primary,
                            fontSize: 18,
                            fontFamily: Fonts.medium),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              // height: 100,
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