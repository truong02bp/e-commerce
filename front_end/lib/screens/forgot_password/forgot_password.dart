import 'package:ecommerce/screens/forgot_password/components/body.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {

  static final String routeName = "/forgot-password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot password'),
      ),
      body: Body(),
    );
  }
}
