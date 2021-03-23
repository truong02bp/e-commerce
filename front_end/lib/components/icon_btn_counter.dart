import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../size_config.dart';

class IconBtnWithCounter extends StatelessWidget{

  final String icon;
  final Function onPress;
  final int counter;


  IconBtnWithCounter({this.icon, this.onPress, this.counter});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.all(12),
        height: getProportionateHeight(40),
        width: getProportionateWidth(40),
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(26),
        ),
        child: SvgPicture.asset(icon),
      ),
      Positioned(
        right: 0,
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            height: getProportionateWidth(16),
            width: getProportionateWidth(16),
            decoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white)
            ),
            child: Center(child: Text('$counter', style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateWidth(10),
                height: 1
            ),)),
          ),
        ),
      )
    ]);
  }

}