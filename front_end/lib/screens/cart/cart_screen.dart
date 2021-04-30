import 'package:flutter/material.dart';

import 'components/body.dart';

class CartScreen extends StatelessWidget {

  static final String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Body(),
    );
  }
}