import 'package:ecommerce/screens/complete_profile/components/body.dart';
import 'package:flutter/material.dart';

class CompleteProfile extends StatelessWidget {

  static final String routeName = "/complete-profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Body(),
    );
  }
}
