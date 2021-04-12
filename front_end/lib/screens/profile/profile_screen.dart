import 'package:ecommerce/blocs/user_bloc.dart';
import 'package:ecommerce/screens/profile/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  static final String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: BlocProvider(
        create: (context) => UserBloc(),
        child: Body()),
    );
  }
}
