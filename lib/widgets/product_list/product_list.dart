import 'package:flutter/cupertino.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/navigation/routes.dart';

typedef RenderItem = Widget Function(Product item);

class ProductList extends StatefulWidget {
  const ProductList({Key? key, required this.items, required this.renderItem})
      : super(key: key);
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
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return widget.renderItem(item);
        },
      ),
    );
  }
}
