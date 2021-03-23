import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class LoginSuccessBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.05,
        ),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4,
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.1,
        ),
        Text(
          'Login success',
          style: TextStyle(
              fontSize: getProportionateWidth(30),
              fontWeight: FontWeight.bold,
              color: kPrimaryColor),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.15,
        ),
        Container(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: DefaultButton(text: 'Back to home', press: () {
            Navigator.pushNamed(context, HomeScreen.routeName);
          }),
        )
      ],
    );
  }
}
