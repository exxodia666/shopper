import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper/bloc/product_list/product_list_bloc.dart';
import 'package:shopper/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // context.read<ProductsCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
      if (state.status == ProductListStatus.isLoading) {
        return const Center(
          child: CupertinoActivityIndicator(
            color: Colors.black,
          ),
        );
      }
      return Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Stack(
            children: [
              Column(
                children: [
                  GridProductList(
                    items: state.products,
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

                    // Change GridProductList top to 60 if there is SearchBar
                    // Positioned(
                    //     top: 10,
                    //     width: MediaQuery.of(context).size.width * 0.9,
                    //     child: const CustomSearchBar()
                    // ),
