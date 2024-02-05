import 'package:flutter/cupertino.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/models/models.dart';
import '../grid_product_item/grid_product_item.dart';

class GridProductList extends StatefulWidget {
  const GridProductList({Key? key, required this.items}) : super(key: key);
  final List<Product> items;
  @override
  State<GridProductList> createState() => _GridProductListState();
}

class _GridProductListState extends State<GridProductList> {
  navigate() {
    navigateTo(context, Routes.details);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: GridView.builder(
          primary: false,
          // scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            // horizontal: 0.0,

            // change top to 60 if Search bar appear
            // top: 60,
            bottom: 120,
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3.1 / 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            final item = widget.items[index];
            return GridProductItem(
              item: item,
              onProductPress: navigate,
            );
          },
        ),
      ),
    );
  }
}
