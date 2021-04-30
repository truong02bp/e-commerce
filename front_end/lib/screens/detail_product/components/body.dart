import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/screens/detail_product/components/product_images.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final Product product;

  Body({this.product});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImages(
            images: product.images,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 15, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.title}',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('\$${product.price}',
                    style: TextStyle(fontSize: 20, color: Colors.orange)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Row(
                      children: List.generate(product.rating.toInt() + 1,
                          (index) => buildStart(index: index)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${product.rating}',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      width: getProportionateWidth(20),
                    ),
                    Text(
                      'Selled : 3',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('${product.description}')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildStart({int index}) {
    final rating = widget.product.rating;
    if (index >= rating) {
      return Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    }
    if (index > rating - 1 && index < rating)
      return Icon(
        Icons.star_half,
        color: kPrimaryColor,
      );
    return Icon(
      Icons.star,
      color: kPrimaryColor,
    );
  }
}
