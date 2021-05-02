import 'package:ecommerce/components/custom_banner.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/size_config.dart';

class SplashContent extends StatelessWidget {
  String text;
  String image;

  SplashContent({this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        CustomBanner(text: 'Shoppe'),
        Text(text, textAlign: TextAlign.center,),
        Spacer(flex: 2,),
        Image.asset(
          image,
          height: getProportionateHeight(265),
          width: getProportionateWidth(235),
        )
      ],
    );
  }
}