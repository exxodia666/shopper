import 'package:flutter/material.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/typography.dart';

class ProductItem extends StatefulWidget {
  const ProductItem(
      {Key? key, required this.item, required this.onProductPress})
      : super(key: key);
  final Function onProductPress;
  final Product item;
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onProductPress();
      },
      child: Container(
        height: 360,
        // width: MediaQuery.of(context).size.width * 0.9,
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
        child: Column(
          children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20.0)),
                child: Image.network(
                  widget.item.image,
                  width: 400,
                  height: 300,
                  fit: BoxFit.fitWidth,
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: TypographyCustom.medium(
                          text: widget.item.title,
                          color: CustomColors.black,
                          fontSize: 20,
                        ),
                      ),
                      TypographyCustom.medium(
                        text: widget.item.price.toString(),
                        color: CustomColors.placeholder,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  InkWell(
                    customBorder:
                        Border.all(color: CustomColors.black, width: 1),
                    onTap: () {},
                    child: const Icon(Icons.shopping_cart_rounded),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
