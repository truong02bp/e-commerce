import 'package:flutter/material.dart';

import '../../../size_config.dart';
class BannerCategory extends StatelessWidget {

  final String image;
  final String label;
  final String label2;
  final Function onPress;

  BannerCategory({this.image, this.label, this.label2, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: SizedBox(
        width: getProportionateWidth(242),
        height: getProportionateHeight(100),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(children: [
              Image.asset(image),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF343434).withOpacity(0.4),
                          Color(0xFF343434).withOpacity(0.15),
                        ])),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 12),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: '$label\n',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  TextSpan(
                    text: '$label2',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ])),
              ),
            ])),
      ),
    );
  }
}
