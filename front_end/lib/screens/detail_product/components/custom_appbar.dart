import 'package:ecommerce/components/bell.dart';
import 'package:ecommerce/components/cart.dart';
import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class AppbarCustom extends PreferredSize {
  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              height: getProportionateHeight(40),
              width: getProportionateWidth(40),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(26),
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios)
                ),
            ),
            Spacer(
              flex: 12,
            ),
            Cart(
              counter: 3,
            ),
            Spacer(),
            Bell(counter: 3),
          ],
        ),
      ),
    );
  }
}
