import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);

const String EMPTY_PASSWORD_ERROR = "Please enter your password";
const String EMPTY_EMAIL_ERROR = "Please enter your email";
const String EMAIL_INVALID_ERROR = "Email is invalid";
const String CONFIRM_PASSWORD_ERROR = "Confirm password not like password";
final RegExp emailRegExp = RegExp("^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$");
final otpDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(
        vertical: getProportionateWidth(10),
        horizontal: getProportionateHeight(20)
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: kPrimaryColor)
    )
);

const String baseUrl = "http://localhost:8080/api";
