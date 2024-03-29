import 'package:flutter/material.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/typography.dart';
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
        price: 40000,
        isFavorite: false),
    const Product(
        id: 'fasfasfasfasfas',
        rating: 40,
        image: 'https://picsum.photos/250?image=5',
        description: 'fasfasfasfasfas',
        title: 'Macbook Air',
        price: 40000,
        isFavorite: false),
    const Product(
        id: 'fasfasfasfasfas',
        rating: 40,
        image: 'https://picsum.photos/250?image=7',
        description: 'fasfasfasfasfas',
        title: 'Macbook Air',
        price: 40000,
        isFavorite: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: TypographyCustom.medium(
          text: 'Apparel',
          color: CustomColors.black,
        ),
      ),
      extendBody: true,
      body: ProductList(
        items: products,
        renderItem: (item) {
          return ProductItem(item: item, onProductPress: () {});
        },
      ),
    );
  }
}
