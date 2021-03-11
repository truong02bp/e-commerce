
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {

  String text;
  Function press;


  DefaultButton({@required this.text, @required this.press});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateHeight(50),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: kPrimaryColor,
        onPressed: press,
        child: Text(text,
          style: TextStyle(
              fontSize: getProportionateWidth(18)
          ),),
      ),
    );
  }
}
