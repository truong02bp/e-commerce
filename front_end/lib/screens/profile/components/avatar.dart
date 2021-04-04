import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateHeight(150),
      width: getProportionateWidth(150),
      child: Stack(
          fit: StackFit.expand,
          overflow: Overflow.visible,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/Profile Image.png",
              ),
            ),
            Positioned(
              right: -10,
              bottom: 0,
              child: SizedBox(
                height: getProportionateHeight(40),
                width: getProportionateWidth(40),
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.white)
                  ),
                  color: Color(0xFFF5F6F9),
                  onPressed: (){},
                  child: SvgPicture.asset("assets/icons/Camera Icon.svg",),
                ),
              ),
            )
          ]),
    );
  }
}
