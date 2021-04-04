import 'package:ecommerce/components/bottom_bar.dart';
import 'package:ecommerce/screens/profile/components/avatar.dart';
import 'package:ecommerce/screens/profile/components/profile_card.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateHeight(25),),
        Center(
          child: Avatar()
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
          child: Column(
            children: [
              ProfileCard(icon: "assets/icons/User.svg", text: "My Account", onTap: (){},),
              SizedBox(height: getProportionateHeight(25),),
              ProfileCard(icon: "assets/icons/Bell.svg", text: "Notifications", onTap: (){},),
              SizedBox(height: getProportionateHeight(25),),
              ProfileCard(icon: "assets/icons/Settings.svg", text: "Settings", onTap: (){},),
              SizedBox(height: getProportionateHeight(25),),
              ProfileCard(icon: "assets/icons/Question mark.svg", text: "Help center", onTap: (){},),
              SizedBox(height: getProportionateHeight(25),),
              ProfileCard(icon: "assets/icons/Log out.svg", text: "Log out", onTap: (){},),
            ],
          ),
        ),
        BottomBar()
      ],
    );

  }
}
