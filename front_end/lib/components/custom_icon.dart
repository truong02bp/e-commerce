import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {

  String image;


  CustomIcon({this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        padding: EdgeInsets.all(5),
        child: SvgPicture.asset(image,),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Color(0XFFF5F6F9),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
