import 'package:ecommerce/screens/home/components/body.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {

  static final String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
