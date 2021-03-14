import 'package:ecommerce/screens/login_success/components/body.dart';
import 'package:flutter/material.dart';
class LoginSuccess extends StatelessWidget {

  static final String routeName = "/login-success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginSuccessBody(),
    );
  }
}
