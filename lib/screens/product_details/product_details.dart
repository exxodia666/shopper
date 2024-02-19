import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/bloc/cart/cart_bloc.dart';
import 'package:shopper/bloc/product_list/product_list_bloc.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/typography.dart';
import 'package:shopper/widgets/widgets.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        var filtered = state.getFilteredProductById(widget.id);
        if (filtered.isEmpty) {
          return TypographyCustom.medium(text: 'Error');
        } else {
          var item = filtered[0];
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 10),
                  child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      child: Image.network(
                        item.image,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 360,
                        fit: BoxFit.fitHeight,
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TypographyCustom.semiBold(
                                text: item.title,
                                color: CustomColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 22)
                            // Rating(
                            //   rating: item.rating ?? 0,
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: TypographyCustom.medium(
                              text: item.price.toString(),
                              fontWeight: FontWeight.w400,
                              color: CustomColors.lightGrey,
                              fontSize: 18)),
                      Container(
                          margin: const EdgeInsets.only(bottom: 18),
                          child: TypographyCustom.medium(
                              text: item.description,
                              // fontWeight: FontWeight.w200,
                              color: CustomColors.lightGrey,
                              fontSize: 16,
                              height: 1.5)),
                      Button(
                          color: item.inCart
                              ? CustomColors.red
                              : CustomColors.primary,
                          title:
                              item.inCart ? 'Remove from cart' : 'Add to cart',
                          textColor: CustomColors.white,
                          onPress: () {
                            var user = context.read<AppBloc>().state.user;
                            context.read<CartBloc>().add(item.inCart
                                ? RemoveFromCart(
                                    productId: item.id, userId: user.id)
                                : AddToCart(
                                    productId: item.id, userId: user.id));
                            context
                                .read<ProductListBloc>()
                                .add(ProductListFetch(userId: user.id));
                          })
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ]),
            ),
          );
        }
      },
    );
  }
}
