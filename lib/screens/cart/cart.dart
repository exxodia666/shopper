import 'package:flutter/cupertino.dart';
import 'package:shopper/models/product.dart';
import 'package:shopper/widgets/widgets.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
              return CartProductItem(
                item: item,
                onProductPress: () {},
                onDeletePress: () {},
              );
            },
          ),
        ));
  }
}
