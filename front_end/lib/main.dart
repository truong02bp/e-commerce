import 'package:ecommerce/routes.dart';
import 'package:ecommerce/screens/splash/splash.dart';
import 'package:ecommerce/theme.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: getTheme(),
      home: Scaffold(
        body: SplashScreen(),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }

}
