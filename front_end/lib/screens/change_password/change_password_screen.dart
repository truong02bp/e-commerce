import 'package:flutter/material.dart';
import 'components/body.dart';
class ChangePasswordScreen extends StatelessWidget {

  static final String routeName = "/change-password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change password'),
      ),
      body: Body(),
    );
  }
}