import 'package:ecommerce/components/icon_btn_counter.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
class Cart extends StatelessWidget {
  
  final int counter;

  Cart({this.counter});

  @override
  Widget build(BuildContext context) {
    return IconBtnWithCounter(
            icon: "assets/icons/Cart Icon.svg",
            counter: counter,
            onPress: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          );
  }
}