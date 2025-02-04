import 'package:flutter/material.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/typography.dart';
import 'package:shopper/widgets/animated_heart/animated_heart.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    fit: BoxFit.fitHeight,
                    width: double.infinity,
                    height: 160,
                  )),
            ),
            Positioned(
                top: 5,
                right: 5,
                child: AnimatedHeart(
                  isFavorite: widget.item.isFavorite,
                  onPress: () {
                    widget.onFavoritePress();
                  },
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TypographyCustom.medium(
                      text: widget.item.title,
                      color: CustomColors.black,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TypographyCustom.medium(
                      text: widget.item.price.toString(),
                      color: CustomColors.placeholder,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              InkWell(
                customBorder: Border.all(color: CustomColors.black, width: 1),
                onTap: () {
                  widget.onCartPress();
                },
                child: widget.item.inCart
                    ? const Icon(
                        Icons.shopping_cart,
                        color: CustomColors.green,
                      )
                    : const Icon(
                        Icons.add_shopping_cart,
                        color: CustomColors.black,
                      ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
