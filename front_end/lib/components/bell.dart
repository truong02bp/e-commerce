import 'package:ecommerce/components/icon_btn_counter.dart';
import 'package:flutter/material.dart';
class Bell extends StatelessWidget {
  final int counter;

  Bell({this.counter});
  
  @override
  Widget build(BuildContext context) {
    return IconBtnWithCounter(
            icon: "assets/icons/Bell.svg",
            counter: counter,
            onPress: () {},
          );
  }
}