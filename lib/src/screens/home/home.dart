import 'package:flutter/material.dart';
import 'package:shopper/src/model/product.dart';
import 'package:shopper/src/widgets/grid_product_list/grid_product_list.dart';
import 'package:shopper/src/widgets/search_bar/search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        child: Stack(
          children: [
            Column(
              children: [
                GridProductList(
                  items: products,
                ),
              ],
            ),
            Positioned(
                top: 10,
                width: MediaQuery.of(context).size.width * 0.9,
                child: const SearchBar()),
          ],
        ),
        // ),
      ),
    );
  }
}
