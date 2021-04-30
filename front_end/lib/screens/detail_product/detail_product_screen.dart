
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/screens/detail_product/components/custom_appbar.dart';
import 'package:ecommerce/screens/detail_product/components/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class DetailProductScreen extends StatelessWidget {
  static final String routeName = "/detail-product";

  @override
  Widget build(BuildContext context) {
    // final DetailProductArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: AppbarCustom(),
      body: Body(product: demoProducts[0],),
      bottomNavigationBar: CustomBottomAppbar(),
    );
  }
}

class DetailProductArguments {
  final Product product;

  DetailProductArguments({this.product});
}
