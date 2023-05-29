import 'package:flutter/material.dart';
import 'package:shopper/src/widgets/product_item/product_item.dart';
import 'package:shopper/src/widgets/product_list/product_list.dart';
import '../../model/product.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({
    Key? key,
  }) : super(key: key);
  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  var products = [
    Product(
        image: 'https://picsum.photos/250?image=2',
        title: 'Macbook Air',
        price: 'Rs. 40,000'),
    Product(
        image: 'https://picsum.photos/250?image=5',
        title: 'Charger',
        price: 'Rs. 500'),
    Product(
        image: 'https://picsum.photos/250?image=7',
        title: 'Car',
        price: 'Rs. 140,000'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Apparel',
          style:
              TextStyle(color: CustomColors.black, fontFamily: Fonts.regular),
        ),
      ),
      extendBody: true,
      body: ProductList(
        items: products,
        renderItem: (item) {
          return ProductItem(item: item, onProductPress: () {});
        },
      ),
      // bottomNavigationBar: const BottomAppBar(
      //   elevation: 0,
      //   color: Colors.transparent,
      //   child: BottomBar(),
      // ),
    );
  }
}