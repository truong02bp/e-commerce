import 'package:flutter/material.dart';

import 'components/body.dart';
class ProductScreen extends StatelessWidget {

  static final String routeName = "/admin/products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List products'),
      ),
      body: Body(),
    );
  }
}