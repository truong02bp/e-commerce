
import 'package:ecommerce/screens/complete_profile/complete_profile.dart';
import 'package:ecommerce/screens/forgot_password/forgot_password.dart';
import 'package:ecommerce/screens/login_success/login_success.dart';
import 'package:ecommerce/screens/otp/otp.dart';
import 'package:ecommerce/screens/sign_in/sign_in.dart';
import 'package:ecommerce/screens/sign_up/sign_up.dart';
import 'package:ecommerce/screens/splash/splash.dart';
import 'package:flutter/material.dart';

final Map<String,WidgetBuilder> routes = {
  SplashScreen.routeName : (context) => SplashScreen(),
  SignIn.routeName : (context) => SignIn(),
  ForgotPassword.routeName : (context) => ForgotPassword(),
  SignUp.routeName : (context) => SignUp(),
  LoginSuccess.routeName : (context) => LoginSuccess(),
  CompleteProfile.routeName : (context) => CompleteProfile(),
  Otp.routeName : (context) => Otp(),
};