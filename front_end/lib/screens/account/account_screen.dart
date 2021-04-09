import 'package:ecommerce/screens/account/components/body.dart';
import 'package:flutter/material.dart';
class AccountScreen extends StatelessWidget {

  static final String routeName = "/account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Body(),
    );
  }
}