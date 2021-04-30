import 'package:ecommerce/components/bell.dart';
import 'package:ecommerce/components/cart.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class DetailProductScreen extends StatelessWidget {
  static final String routeName = "/detail-product";

  @override
  Widget build(BuildContext context) {
    final DetailProductArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(child: Body(product: arguments.product,))
    );
  }
}

class DetailProductArguments {
  final Product product;

  DetailProductArguments({this.product});
}
