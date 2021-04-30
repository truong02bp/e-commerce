import 'package:ecommerce/components/bell.dart';
import 'package:ecommerce/components/cart.dart';
import 'package:ecommerce/model/product.dart';
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
    return Column(
      children: [
        
      ],
    );
  }
}
