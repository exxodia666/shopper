import 'package:flutter/cupertino.dart';
import 'package:shopper/src/model/product.dart';
import 'package:shopper/src/widgets/favorite_product_item/favorite_product_item.dart';
import 'package:shopper/src/widgets/product_list/product_list.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  var products = List.generate(
      1000,
      (index) => Product(
          image: 'https://picsum.photos/250?image=2',
          title: 'Macbook Air',
          price: 'Rs. 40,000'));

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ProductList(
        items: products,
        renderItem: (item) {
          return FavoriteProductItem(
            item: item,
            onProductPress: () {},
            onDeletePress: () {},
          );
        },
      ),
    ));
  }
}
