import 'package:ecommerce/blocs/sign_up_bloc.dart';
import 'package:ecommerce/components/custom_banner.dart';
import 'package:ecommerce/components/custom_icon.dart';
import 'package:ecommerce/screens/sign_up/components/sign_up_form.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignUpBody extends StatelessWidget {

  static Widget create(BuildContext context){
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: SignUpBody(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: getProportionateHeight(20),
            ),
            CustomBanner(text: 'Register Account'),
            SizedBox(
              height: getProportionateHeight(20),
            ),
            Text('Complete your details or continue with social media',),
            SignUpForm(),
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
