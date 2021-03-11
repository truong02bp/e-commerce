import 'package:ecommerce/components/custom_banner.dart';
import 'package:ecommerce/components/custom_icon.dart';
import 'package:ecommerce/screens/complete_profile/components/complete_form.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            CustomBanner(text: 'Complete profile'),
            SizedBox(
              height: getProportionateHeight(20),
            ),
            Text('Complete your details or continue with social media'),
            SizedBox(
              height: getProportionateHeight(20),
            ),
            CompleteForm(),
            SizedBox(
              height: getProportionateHeight(20),
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
            Text('By continuing your confirm that you agree with our Term and Condition', textAlign: TextAlign.center,)
          ],

        ),
      ),
    );
  }
}
