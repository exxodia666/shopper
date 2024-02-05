import 'package:flutter/material.dart';
import 'package:shopper/theme/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          color: CustomColors.placeholder,
          borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(Icons.search),
            Container(
                margin: const EdgeInsets.only(left: 5),
                child: const Text(
                  'Search T-shirt',
                  style: TextStyle(color: CustomColors.secondary),
                ))
          ],
        ),
      ),
    );
  }
}
