import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    GestureDetector(
                      child: SvgPicture.asset("assets/icons/Shop Icon.svg"),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: SvgPicture.asset("assets/icons/Heart Icon_2.svg"),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: SvgPicture.asset("assets/icons/Chat bubble Icon.svg"),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: SvgPicture.asset("assets/icons/User.svg"),
                      onTap: () {},
                    ),
                  ]),
                ],
              )
          ),
        ],
      ),
    );
  }
}
