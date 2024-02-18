import 'package:flutter/material.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/fonts.dart';

class FavoriteProductItem extends StatefulWidget {
  const FavoriteProductItem(
      {Key? key,
      required this.item,
      required this.onProductPress,
      required this.onDeletePress})
      : super(key: key);
  final Function onProductPress;
  final Function onDeletePress;
  final Product item;
  @override
  State<FavoriteProductItem> createState() => _FavoriteProductItemState();
}

class _FavoriteProductItemState extends State<FavoriteProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onProductPress();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
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
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  child: Image.network(
                    widget.item.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitWidth,
                  )),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.title,
                        style: const TextStyle(
                            color: CustomColors.black,
                            fontSize: 20,
                            fontFamily: Fonts.medium),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.item.price.toString(),
                        style: const TextStyle(
                            color: CustomColors.placeholder,
                            fontSize: 18,
                            fontFamily: Fonts.medium),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      // customBorder: Border.all(color: CustomColors.black, width: 1),
                      onTap: () {
                        widget.onDeletePress();
                      },
                      child: const Icon(Icons.delete_rounded),
                    ),
                    Spacer()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
