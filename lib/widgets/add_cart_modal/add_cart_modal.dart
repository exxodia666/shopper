import 'package:flutter/material.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/theme/typography.dart';

class AddToCartModal extends StatefulWidget {
  final int counter;
  final Product item;

  final Function decrement;
  final Function increment;
  final Function reset;

  const AddToCartModal(
      {super.key,
      required this.item,
      required this.counter,
      required this.increment,
      required this.decrement,
      required this.reset});

  @override
  State<AddToCartModal> createState() => _AddToCartModalState();
}

class _AddToCartModalState extends State<AddToCartModal> {
  @override
  void deactivate() {
    super.deactivate();
    widget.reset();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          child: Image.network(
            widget.item.image,
            fit: BoxFit.fitWidth,
          )),
      title: TypographyCustom.regular(text: 'Add ot cart ${widget.item.title}'),
      content: TypographyCustom.medium(
          text:
              'Rs. ${widget.item.price}, Total Rs.${widget.item.price * widget.counter}'),
      titlePadding: const EdgeInsets.symmetric(horizontal: 0.0),
      actions: [
        TypographyCustom.medium(text: 'Count'),
        GestureDetector(
          onTap: () {
            widget.decrement();
          },
          child: const Icon(Icons.remove),
        ),
        TypographyCustom.medium(text: widget.counter.toString()),
        GestureDetector(
          onTap: () {
            widget.increment();
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
