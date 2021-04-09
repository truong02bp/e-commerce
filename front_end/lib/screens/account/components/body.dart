import 'package:ecommerce/screens/profile/components/avatar.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateHeight(20),
        ),
        Avatar(),
        TextField(
          
        )
      ],
    );
  }
}