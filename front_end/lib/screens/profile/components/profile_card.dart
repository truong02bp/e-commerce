import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class ProfileCard extends StatelessWidget {

  final String icon;

  final Function onTap;

  final String text;


  ProfileCard({this.icon, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateHeight(60),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25)
          ),
          child: Row(
            children: [
              Spacer(),
              SvgPicture.asset(
                icon, color: Colors.orange, height: 25,),
              Spacer(),
              Text(text, style: TextStyle(
                  fontSize: 16
              ),),
              Spacer(flex: 9,),
              Icon(
                Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.4),),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
