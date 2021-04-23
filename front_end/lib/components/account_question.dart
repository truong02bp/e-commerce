import 'package:ecommerce/screens/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../size_config.dart';
class AccountQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have a account?',
          style: TextStyle(
              fontSize: getProportionateWidth(16)
          ),),
        GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(SignUp.routeName);
          },
          child: Text('  Sign up',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor
            ),),
        )
      ],
    );
  }
}
