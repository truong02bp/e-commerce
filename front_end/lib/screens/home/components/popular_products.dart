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
                              demoProducts[index].images[0],
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(demoProducts[index].title),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${demoProducts[index].price}'),
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
            )),
      ),
    );
  }
}
