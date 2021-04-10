import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: box(
                            widget:
                                SvgPicture.asset("assets/icons/Shop Icon.svg")),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: box(
                            widget: SvgPicture.asset(
                                "assets/icons/Heart Icon_2.svg")),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: box(
                            widget: SvgPicture.asset(
                                "assets/icons/Chat bubble Icon.svg")),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: box(
                            widget: SvgPicture.asset("assets/icons/User.svg")),
                        onTap: () {
                          Navigator.pushNamed(context, ProfileScreen.routeName);
                        },
                      ),
                    ]),
              ],
            )),
      ],
    );
  }

  Container box({Widget widget}) {
    return Container(
      height: getProportionateHeight(30),
      width: getProportionateWidth(30),
      padding: EdgeInsets.all(5),
      child: widget,
    );
  }
}
