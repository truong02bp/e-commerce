import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatelessWidget {

  static final String routeName = "/detail-product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [],
      ),
    );
  }

}

class DetailProductArguments {

  final Product product;

  DetailProductArguments({this.product});
}

