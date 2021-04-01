import 'package:flutter/material.dart';

import '../../../size_config.dart';
class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      height: 90,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateWidth(20),
          vertical: getProportionateHeight(8)),
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)),
      child: Text.rich(TextSpan(
          text: 'A summer surpise\n',
          style: TextStyle(fontSize: 18, color: Colors.white),
          children: [
            TextSpan(text: 'Cashback 20%', style: TextStyle(fontSize: 24))
          ])),
    );
  }
}
