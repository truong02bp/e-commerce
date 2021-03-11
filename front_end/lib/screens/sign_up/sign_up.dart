import 'package:ecommerce/screens/sign_up/components/body.dart';
import 'package:flutter/material.dart';
class SignUp extends StatelessWidget {

  static final String routeName = "/sign-up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: SignUpBody(),
    );
  }
}
