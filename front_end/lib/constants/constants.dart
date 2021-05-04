import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);

const String EMPTY_PASSWORD_ERROR = "Please enter your password";
const String EMPTY_EMAIL_ERROR = "Please enter your email";
const String EMAIL_INVALID_ERROR = "Email is invalid";
const String CONFIRM_PASSWORD_ERROR = "Confirm password not like password";
final RegExp emailRegExp = RegExp(
    "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$");
final otpDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(
        vertical: getProportionateWidth(10),
        horizontal: getProportionateHeight(20)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: kPrimaryColor)));

Widget buildLoading({bool isLoading, Color color}) {
  if (isLoading)
    return Container(
      color: color == null ? null : color,
      child: Image.asset(
        "assets/images/loading.gif",
        height: getProportionateHeight(100),
        width: getProportionateWidth(100)
        ,
      ),
    );
  return Container();
}

void showUpdateMessage(BuildContext context, bool isUpdateSuccess) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: SizedBox(
      height: getProportionateHeight(100),
      child: Center(
        child: isUpdateSuccess == true
            ? Column(
                children: [
                  Text(
                    'Update information success !',
                    style: TextStyle(
                        fontSize: 20, color: Colors.green.withOpacity(0.8)),
                  ),
                  SizedBox(
                    height: getProportionateHeight(10),
                  ),
                  Image.asset(
                    "assets/images/success.jpg",
                    height: 60,
                    width: 100,
                  )
                ],
              )
            : Text(
                'Update information failure !',
                style: TextStyle(
                    fontSize: 20, color: Colors.redAccent.withOpacity(0.8)),
              ),
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
