import 'package:flutter/cupertino.dart';
import 'package:shopper/src/model/product.dart';
import 'package:shopper/src/widgets/cart_product_item/cart_product_item.dart';
import 'package:shopper/src/widgets/product_list/product_list.dart';

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
