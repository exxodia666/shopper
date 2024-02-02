import 'package:flutter/cupertino.dart';
import 'package:shopper/models/product.dart';
import 'package:shopper/navigation/routes.dart';

typedef RenderItem = Widget Function(Product item);

class ProductList extends StatefulWidget {
  const ProductList({Key? key, required this.items, required this.renderItem }) : super(key: key);
  final List<Product> items;
  final RenderItem renderItem;
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  navigate() {
    navigateTo(context, Routes.details);
    // GoRouter.of(context).go(Routes.details);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: ListView.builder(
        // scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        // padding: const EdgeInsets.symmetric(
        //   horizontal: 24.0,
        //   vertical: 10,
        // ),
        // Let the ListView know how many items it needs to build.
        itemCount: widget.items.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return widget.renderItem(item);
        },
      ),
    );
  }
}
