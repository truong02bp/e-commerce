import 'package:flutter/material.dart';

import 'components/body.dart';
class ManagerScreen extends StatelessWidget {

  static final String routeName = "/admin/manager";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}