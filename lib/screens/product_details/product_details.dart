import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/fonts.dart';
import 'package:shopper/widgets/widgets.dart';
import 'package:shopper/models/models.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var item = const Product(
        id: 'dadasdasdasdasdasdasd',
        image: 'https://picsum.photos/250?image=5',
        title: 'Charger',
        price: 500,
        rating: 4,
        description:
            'Trendy, youthful and innovative are what you can expect from the smart fashion for men, women and children from United Colors of Benetton. Cool track pants, stylish T-shirts, colourful backpacks, floral print trousers, canvas boat shoes – browse through the brand’s collection on AJIO to explore the latest in high street fashion.Trendy, youthful and innovative are what you can expect from the smart fashion for men, women and children from United Colors of Benetton. Cool track pants, stylish T-shirts, colourful backpacks, floral print trousers, canvas boat shoes – browse through the brand’s collection on AJIO to explore the latest in high street fashion.');

    return SafeArea(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(children: [
            // Container(
            //   height: 56,
            //   decoration: const BoxDecoration(
            //     color: CustomColors.primary,
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 24.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: const [
            //         InkWell(
            //           child: Icon(Icons.arrow_back),
            //         ),
            //         InkWell(
            //           child: Icon(Icons.shopping_cart_rounded),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 10),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: Image.network(
                    item.image,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 360,
                    fit: BoxFit.fitHeight,
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                              // height: 1.5,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.black,
                              fontFamily: Fonts.semibold,
                              fontSize: 22),
                        ),
                        // Rating(
                        //   rating: item.rating ?? 0,
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      item.price.toString(),
                      style: const TextStyle(
                          // height: 1.5,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.lightGrey,
                          fontFamily: Fonts.medium,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    child: Text(
                      item.description,
                      style: const TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.lightGrey,
                          fontFamily: Fonts.medium,
                          fontSize: 14),
                    ),
                  ),
                  Button(
                    color: CustomColors.primary,
                    title: 'Add to cart',
                    textColor: CustomColors.white,
                    onPress: () {},
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
