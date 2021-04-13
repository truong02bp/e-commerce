
import 'package:ecommerce/blocs/user_bloc.dart';
import 'package:ecommerce/screens/account/components/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
class AccountScreen extends StatelessWidget {

  static final String routeName = "/account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: BlocProvider(
        create: (context) => UserBloc(),
        child: SingleChildScrollView(child: Body())
        ),
    );
  }
}