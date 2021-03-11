import 'package:ecommerce/components/account_question.dart';
import 'package:ecommerce/components/custom_banner.dart';
import 'package:ecommerce/components/custom_icon.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/sign_in/components/sign_in_form.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/custom_suffix_icons.dart';
class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomBanner(text: 'Welcome back '),
                SizedBox(height: getProportionateHeight(10),),
                Text('Sign in with your email and password \nor continue with social media',
                style: TextStyle(
                  fontSize: getProportionateWidth(14),
                ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateHeight(50),),
                SignInForm(),
                SizedBox(
                  height: getProportionateHeight(30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIcon(image: "assets/icons/twitter.svg",),
                    CustomIcon(image: "assets/icons/facebook-2.svg",),
                    CustomIcon(image: "assets/icons/google-icon.svg",),
                  ],
                ),
                SizedBox(
                  height: getProportionateHeight(30),
                ),
                AccountQuestion(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




