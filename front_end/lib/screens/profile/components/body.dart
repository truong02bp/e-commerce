import 'package:ecommerce/blocs/user_bloc.dart';
import 'package:ecommerce/components/bottom_bar.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/screens/account/account_screen.dart';
import 'package:ecommerce/components/avatar.dart';
import 'package:ecommerce/screens/profile/components/information.dart';
import 'package:ecommerce/screens/profile/components/profile_card.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateHeight(25),
        ),
        Information(),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Column(
            children: [
              ProfileCard(
                icon: "assets/icons/User.svg",
                text: "My Account",
                onTap: () {
                  Navigator.pushNamed(context, AccountScreen.routeName);
                },
              ),
              SizedBox(
                height: getProportionateHeight(25),
              ),
              ProfileCard(
                icon: "assets/icons/Bell.svg",
                text: "Notifications",
                onTap: () {},
              ),
              SizedBox(
                height: getProportionateHeight(25),
              ),
              ProfileCard(
                icon: "assets/icons/Settings.svg",
                text: "Settings",
                onTap: () {},
              ),
              SizedBox(
                height: getProportionateHeight(25),
              ),
              ProfileCard(
                icon: "assets/icons/Question mark.svg",
                text: "Help center",
                onTap: () {},
              ),
              SizedBox(
                height: getProportionateHeight(25),
              ),
              ProfileCard(
                icon: "assets/icons/Log out.svg",
                text: "Log out",
                onTap: () {},
              ),
            ],
          ),
        ),
        Expanded(child: BottomBar())
      ],
    );
  }
}
