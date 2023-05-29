import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopper/src/model/product.dart';
import 'package:shopper/src/theme/colors.dart';
import 'package:shopper/src/theme/fonts.dart';

class GridProductItem extends StatefulWidget {
  const GridProductItem(
      {Key? key, required this.item, required this.onProductPress})
      : super(key: key);
  final Function onProductPress;
  final Product item;
  @override
  State<GridProductItem> createState() => _GridProductItemState();
}

class _GridProductItemState extends State<GridProductItem> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(widget.item.image);
    }
    return InkWell(
      onTap: () {
        widget.onProductPress();
      },
      child: Column(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Image.network(
                widget.item.image,
                // width: 100,
                // height: 100,
                fit: BoxFit.fitWidth,
              )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        widget.item.title,
                        style: const TextStyle(
                            color: CustomColors.black,
                            fontSize: 16,
                            fontFamily: Fonts.medium),
                      ),
                    ),
                    Text(
                      widget.item.price,
                      style: const TextStyle(
                          color: CustomColors.placeholder,
                          fontSize: 14,
                          fontFamily: Fonts.medium),
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
    );
  }
}
