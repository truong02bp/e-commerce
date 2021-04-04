import 'package:ecommerce/screens/profile/components/avatar.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Avatar()
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
          child: SizedBox(
            width: double.infinity,
            height: getProportionateHeight(60),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3)
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/User.svg", color: Colors.orange, height: 25,),
                  Spacer(),
                  Text('My Account'),
                  Spacer(flex: 9,),
                  Icon(Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.4),),
                  Spacer()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
