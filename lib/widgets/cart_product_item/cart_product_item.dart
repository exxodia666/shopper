import 'package:flutter/material.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/fonts.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem(
      {Key? key,
      required this.item,
      required this.onProductPress,
      required this.onDeletePress,
      required this.onIncrement,
      required this.onDecrement,
      required this.count})
      : super(key: key);

  final Function onProductPress;
  final Function onDeletePress;

  final int count;
  final Function onIncrement;
  final Function onDecrement;

  final Product item;
  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
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
                        height: 9,
                      ),
                      Text(
                        widget.item.price.toString(),
                        style: const TextStyle(
                            color: CustomColors.placeholder,
                            fontSize: 18,
                            fontFamily: Fonts.medium),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              widget.onDecrement();
                            },
                            child: Container(
                                margin: const EdgeInsets.only(right: 12),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: CustomColors.lightGrey),
                                    borderRadius: BorderRadius.circular(10.0)
                                    // color: CustomColors.secondary,
                                    ),
                                child: const Center(child: Text('-'))),
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 12),
                              child: Text(widget.count.toString())),
                          InkWell(
                            onTap: () {
                              widget.onIncrement();
                            },
                            child: Container(
                                margin: const EdgeInsets.only(right: 12),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: CustomColors.lightGrey),
                                    borderRadius: BorderRadius.circular(10.0)
                                    // color: CustomColors.secondary,
                                    ),
                                child: const Center(child: Text('+'))),
                          ),
                        ],
                      )
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
                      onTap: () {
                        widget.onDeletePress();
                      },
                      child: const Icon(Icons.delete_rounded),
                    ),
                    const Spacer()
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
