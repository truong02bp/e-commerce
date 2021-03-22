import 'package:ecommerce/blocs/authentication_bloc.dart';
import 'package:ecommerce/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignIn extends StatelessWidget {
  static final String routeName = "/sign-in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: SignInBody.create(context),
    );
  }
}
