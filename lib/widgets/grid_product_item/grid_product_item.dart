import 'package:flutter/material.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/fonts.dart';

class GridProductItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                onProductPress();
              },
              child: Container(
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    child: Image.network(
                      item.image,
                      fit: BoxFit.fitHeight,
                      width: double.infinity,
                      height: 160,
                    )),
              ),
            ),
            Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () {
                    onFavoritePress();
                  },
                  child: Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                        color: CustomColors.white,
                        borderRadius: BorderRadius.circular(18.0)),
                    //
                    child: item.isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: CustomColors.red,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                          color: CustomColors.black,
                          fontSize: 16,
                          fontFamily: Fonts.medium),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      item.price.toString(),
                      style: const TextStyle(
                          color: CustomColors.placeholder,
                          fontSize: 14,
                          fontFamily: Fonts.medium),
                    ),
                  ],
                ),
              ),
              InkWell(
                customBorder: Border.all(color: CustomColors.black, width: 1),
                onTap: () {
                  onCartPress();
                },
                child: item.inCart
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
