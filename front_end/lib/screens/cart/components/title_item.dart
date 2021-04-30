import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class TitleItem extends StatelessWidget {

  final bool isPicked;

  final String title;

  final Function onPress;

  TitleItem({this.isPicked, this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
          child: Container(
                  height: getProportionateHeight(40),
                  width: SizeConfig.screenWidth / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 20,
                            color: isPicked == true
                                ? Colors.orange
                                : Colors.black.withOpacity(0.5)),
                      ),
                      Container(
                        height: getProportionateHeight(3),
                        color: isPicked == true
                                ? Colors.orange
                                : Colors.black.withOpacity(0.1),
                      )
                    ],
                  )),
    );
  }
}