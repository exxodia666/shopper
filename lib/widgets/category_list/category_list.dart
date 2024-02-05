import 'package:flutter/cupertino.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/widgets/widgets.dart';

class CategoryList extends StatelessWidget {
  final List<Product> products;

  const CategoryList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // navigate() {
    //   navigateTo(context, Routes.details);
    // }
    return Container(
      height: 180,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(),
        // Let the ListView know how many items it needs to build.
        // gridDelegate: SliverGridDelegate(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: products.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          // final item = products[index];
          return const Category();
          //   GridProductItem(
          //   item: item,
          //   onProductPress: navigate,
          // );
        },
      ),
    );
  }
}
