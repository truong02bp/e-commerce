import 'package:ecommerce/screens/profile/components/body.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {

  static final String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Body(),
    );
  }
}
