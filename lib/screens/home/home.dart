import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/app/bloc/app_bloc.dart';
import 'package:shopper/bloc/cart/cart_bloc.dart';
import 'package:shopper/bloc/favorite/favorite_bloc.dart';
import 'package:shopper/bloc/product_list/product_list_bloc.dart';
import 'package:shopper/models/models.dart';
import 'package:shopper/navigation/routes.dart';
import 'package:shopper/theme/colors.dart';
import 'package:shopper/theme/typography.dart';
import 'package:shopper/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getProducts() {
    var user = context.read<AppBloc>().state.user;
    context.read<ProductListBloc>().add(ProductListFetch(userId: user.id));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String currentLocation = GoRouter.of(context).location;
    if (currentLocation == Routes.home) {
      getProducts();
    }
  }

  void onProductPress(String id) {
    navigateTo(context, Routes.details, id: id);
  }

  void onCartPress(Product item, String userId) {
    context.read<CartBloc>().add(item.inCart
        ? RemoveFromCart(productId: item.id, userId: userId)
        : AddToCart(productId: item.id, userId: userId));
    context
        .read<ProductListBloc>()
        .add(ChangeProduct(productId: item.id, inCart: !item.inCart));
    if (!item.inCart) {
      showModalBottomSheet<void>(
        useRootNavigator: true,
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: CustomColors.primaryShadow,
                    spreadRadius: 0.5,
                    blurRadius: 0.1)
              ],
              color: CustomColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: 200,
            // color: CustomColors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: TypographyCustom.semiBold(
                        fontSize: 18,
                        text: 'Would you like to continue shopping?'),
                  ),
                  const Divider(height: 15.0),
                  Button(
                    color: CustomColors.primary,
                    title: 'Continue',
                    textColor: Colors.white,
                    onPress: () => Navigator.pop(context),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Button(
                      color: CustomColors.primary,
                      title: 'Open cart',
                      textColor: Colors.white,
                      onPress: () {
                        Navigator.pop(context);
                        switchTab(context, Routes.cart);
                      }),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  void onFavoritePress(Product item, userId) {
    // Todo add animation on this
    context.read<FavoriteBloc>().add(!item.isFavorite
        ? AddToFavorite(productId: item.id, userId: userId)
        : RemoveFromFavorite(productId: item.id, userId: userId));
    context
        .read<ProductListBloc>()
        .add(ChangeProduct(productId: item.id, isFavorite: !item.isFavorite));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
      return Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Stack(
            children: [
              Column(
                children: [
                  GridProductList(
                    isLoading: state.status == ProductListStatus.isLoading,
                    items: state.products,
                    onFavoritePress: onFavoritePress,
                    onCartPress: onCartPress,
                    onProductPress: onProductPress,
                  ),
                ],
              ),
            ],
          ),
          // ),
        ),
      );
    });
  }
}
