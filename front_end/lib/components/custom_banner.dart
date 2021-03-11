import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class CustomBanner extends StatelessWidget {
  String text;


  CustomBanner({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: getProportionateWidth(36),
          color: kPrimaryColor,
          fontWeight: FontWeight.bold),
    );
  }
}
