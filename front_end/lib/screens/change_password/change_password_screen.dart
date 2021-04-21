import 'package:ecommerce/blocs/user_bloc.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ChangePasswordScreen extends StatelessWidget {

  static final String routeName = "/change-password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change password'),
      ),
      body: BlocProvider(
        create: (context) => UserBloc(),
        child: Body()
        ),
    );
  }
}