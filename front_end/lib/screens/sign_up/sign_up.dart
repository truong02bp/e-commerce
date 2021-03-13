import 'package:ecommerce/blocs/sign_up_bloc.dart';
import 'package:ecommerce/screens/sign_up/components/body.dart';
import 'package:ecommerce/state/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignUp extends StatelessWidget {

  static final String routeName = "/sign-up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: BlocProvider(
          create: (context) =>SignUpBloc(SignUpInitial()),
          child: SignUpBody()
      ),
    );
  }
}
