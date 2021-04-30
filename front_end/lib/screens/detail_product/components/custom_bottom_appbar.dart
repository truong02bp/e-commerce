import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomAppbar extends PreferredSize {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(color: Color(0xff00CC66).withOpacity(0.9)),
          height: getProportionateHeight(50),
          width: SizeConfig.screenWidth / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                "assets/icons/Chat bubble Icon.svg",
                color: Colors.white,
              ),
              Text(
                'Chat now',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: getProportionateHeight(4),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0xff00CC66).withOpacity(0.9),
              border: Border(left: BorderSide(width: 1))),
          height: getProportionateHeight(50),
          width: SizeConfig.screenWidth / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                "assets/icons/Cart Icon.svg",
                color: Colors.white,
              ),
              Text(
                'Add to cart',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: getProportionateHeight(4),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: getProportionateHeight(50),
            color: Colors.red,
            child: Center(
                child: Text(
              'Buy now',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
          ),
        )
      ],
    );
  }
}
