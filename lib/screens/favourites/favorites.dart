import 'package:flutter/cupertino.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/widgets/widgets.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  var products = List.generate(
    1000,
    (index) => const Product(
        id: 'fasfasfasfasfas',
        rating: 40,
        image: 'https://picsum.photos/250?image=2',
        description: 'fasfasfasfasfas',
        title: 'Macbook Air',
        price: 40000),
  );

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
