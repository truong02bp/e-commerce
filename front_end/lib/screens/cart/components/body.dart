import 'package:ecommerce/screens/cart/components/title_item.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isAllPicked = true;
  bool isSalePicked = false;
  bool isBuyAgainPicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateHeight(10),
        ),
        Row(
          children: [
            TitleItem(isPicked: isAllPicked, title: 'All', onPress: (){
              setState(() {
                isAllPicked = true;
                isSalePicked = false;
                isBuyAgainPicked = false;
              });
            },),
            TitleItem(isPicked: isSalePicked, title: 'Sale', onPress: (){
              setState(() {
                isAllPicked = false;
                isSalePicked = true;
                isBuyAgainPicked = false;
              });
            },),
            TitleItem(isPicked: isBuyAgainPicked, title: 'Buy again', onPress: (){
              setState(() {
                isAllPicked = false;
                isSalePicked = false;
                isBuyAgainPicked = true;
              });
            },)
          ],
        )
      ],
    );
  }
}
