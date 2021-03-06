
import 'package:ecommerce/screens/account/account_screen.dart';
import 'package:ecommerce/screens/admin/categories/category_screen.dart';
import 'package:ecommerce/screens/admin/manager/manager_screen.dart';
import 'package:ecommerce/screens/admin/products/product_screen.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/change_password/change_password_screen.dart';
import 'package:ecommerce/screens/complete_profile/complete_profile.dart';
import 'package:ecommerce/screens/detail_product/detail_product_screen.dart';
import 'package:ecommerce/screens/forgot_password/forgot_password.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/login_success/login_success.dart';
import 'package:ecommerce/screens/otp/otp.dart';
import 'package:ecommerce/screens/profile/profile_screen.dart';
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
  HomeScreen.routeName : (context) => HomeScreen(),
  DetailProductScreen.routeName : (context) => DetailProductScreen(),
  ProfileScreen.routeName : (context) => ProfileScreen(),
  AccountScreen.routeName : (context) => AccountScreen(),
  ChangePasswordScreen.routeName : (context) => ChangePasswordScreen(),
  CartScreen.routeName : (context) => CartScreen(),
  ManagerScreen.routeName : (context) => ManagerScreen(),
  ProductScreen.routeName : (context) => ProductScreen(),
  CategoryScreen.routeName : (context) => CategoryScreen(),
};