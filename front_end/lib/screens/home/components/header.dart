import 'package:ecommerce/components/bell.dart';
import 'package:ecommerce/components/cart.dart';
import 'package:ecommerce/components/icon_btn_counter.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../size_config.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateWidth(0)),
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
          Cart(counter: 3,),
          Bell(counter: 3,),
        ],
      ),
    );
  }
}
