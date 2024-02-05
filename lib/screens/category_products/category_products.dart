import 'package:flutter/material.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/fonts.dart';
import 'package:shopper/widgets/widgets.dart';
import 'package:shopper/models/models.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({
    Key? key,
  }) : super(key: key);
  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  var products = [
    const Product(
        id: 'fasfasfasfasfas',
        rating: 40,
        image: 'https://picsum.photos/250?image=2',
        description: 'fasfasfasfasfas',
        title: 'Macbook Air',
        price: 40000),
    const Product(
        id: 'fasfasfasfasfas',
        rating: 40,
        image: 'https://picsum.photos/250?image=5',
        description: 'fasfasfasfasfas',
        title: 'Macbook Air',
        price: 40000),
    const Product(
        id: 'fasfasfasfasfas',
        rating: 40,
        image: 'https://picsum.photos/250?image=7',
        description: 'fasfasfasfasfas',
        title: 'Macbook Air',
        price: 40000),
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
