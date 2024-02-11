import 'package:flutter/material.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/fonts.dart';

class GridProductItem extends StatefulWidget {
  const GridProductItem(
      {Key? key,
      required this.item,
      required this.onProductPress,
      required this.onFavoritePress,
      required this.onCartPress})
      : super(key: key);

  final Product item;
  final Function onProductPress;
  final Function onFavoritePress;
  final Function onCartPress;

  @override
  State<GridProductItem> createState() => _GridProductItemState();
}

class _GridProductItemState extends State<GridProductItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Todo image loader (skeleton loading)
        Stack(
          children: [
            InkWell(
              onTap: () {
                widget.onProductPress();
              },
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  child: Image.network(
                    widget.item.image,
                    fit: BoxFit.fitWidth,
                  )),
            ),
            Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () {
                    widget.onFavoritePress();
                  },
                  child: Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.0)),
                    //
                    child: widget.item.isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border),
                  ),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.title,
                    style: const TextStyle(
                        color: CustomColors.black,
                        fontSize: 16,
                        fontFamily: Fonts.medium),
                  ),
                  Text(
                    widget.item.price.toString(),
                    style: const TextStyle(
                        color: CustomColors.placeholder,
                        fontSize: 14,
                        fontFamily: Fonts.medium),
                  ),
                ],
              ),
              InkWell(
                customBorder: Border.all(color: CustomColors.black, width: 1),
                onTap: () {
                  widget.onCartPress();
                },
                child: widget.item.inCart
                    ? const Icon(
                        Icons.remove_shopping_cart_rounded,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.green,
                      ),
              )
            ],
          ),
        )
      ],
    );
  }
}
