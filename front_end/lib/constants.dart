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
const String ip = "192.168.1.10";
const String baseUrl = "http://$ip:8080/api";
const String minioUrl = "http://$ip:9000/images";

Widget buildLoading({bool isLoading}) {
  if (isLoading)
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        "assets/images/loading.gif",
        height: getProportionateHeight(100),
        width: getProportionateWidth(100),
      ),
    );
  return Container();
}