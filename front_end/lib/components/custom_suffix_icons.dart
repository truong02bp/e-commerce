import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class CustomSuffixIcon extends StatelessWidget {
  String image;

  CustomSuffixIcon({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0,
          getProportionateWidth(20),
          getProportionateWidth(20),
          getProportionateWidth(20)),
      child: SvgPicture.asset(image,
        height: getProportionateHeight(20),),
    );
  }
}