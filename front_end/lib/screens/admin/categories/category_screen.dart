import 'package:ecommerce/screens/cart/components/body.dart';
import 'package:flutter/material.dart';
class CategoryScreen extends StatelessWidget {

  static final String routeName = "/admin/categories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories'),),
      body: Body(),
    );
  }
}