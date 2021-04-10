import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData getTheme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Muli',
      textTheme: textTheme(),
      inputDecorationTheme: inputTheme(),
      appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      centerTitle: true,
      color: Colors.white,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
          headline6: TextStyle(
        color: kTextColor,
        fontSize: 20,
      )));
}

TextTheme textTheme() {
  return TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor));
}

InputDecorationTheme inputTheme(){

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(
          color: kPrimaryColor
      ),
      gapPadding: 15
  );

  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: InputBorder.none,
  );
}
