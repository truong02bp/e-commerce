import 'package:ecommerce/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            demoProducts.length,
                (index) => Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
              child: ProductCard(product: demoProducts[index],)
            )),
      ),
    );
  }
}
