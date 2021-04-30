import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/screens/detail_product/detail_product_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DetailProductScreen.routeName,arguments: DetailProductArguments(product: product));
      },
      child: SizedBox(
        width: getProportionateWidth(170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateHeight(170),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      product.images[0],
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
            Text(product.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${product.price}'),
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon.svg",
                      width: 15,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
