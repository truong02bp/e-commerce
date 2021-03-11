import 'package:ecommerce/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  static final String routeName = "/sign-in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: SingleChildScrollView(child: SignInBody()),
    );
  }
}
