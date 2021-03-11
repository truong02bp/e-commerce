import 'package:ecommerce/screens/otp/components/body.dart';
import 'package:flutter/material.dart';
class Otp extends StatelessWidget {
  static final String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otp Verification'),
      ),
      body: Body(),
    );
  }
}
