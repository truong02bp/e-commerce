import 'package:ecommerce/components/icon_btn_counter.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateHeight(15),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionateWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: getProportionateHeight(40),
                  width: getProportionateWidth(SizeConfig.screenWidth * 0.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSecondaryColor.withOpacity(0.1)),
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: 'Search the product',
                        prefixIcon: Icon(
                          Icons.search,
                          color: kSecondaryColor,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: getProportionateWidth(12),
                            vertical: getProportionateWidth(10))),
                  ),
                ),
                IconBtnWithCounter(icon: "assets/icons/Cart Icon.svg", counter: 3, onPress: (){},),
                IconBtnWithCounter(icon: "assets/icons/Bell.svg", counter: 3, onPress: (){},)
              ],
            ),
          )
        ],
      ),
    ));
  }
}



