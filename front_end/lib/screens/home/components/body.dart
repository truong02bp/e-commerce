import 'package:ecommerce/components/bottom_bar.dart';
import 'package:ecommerce/screens/home/components/banner.dart';
import 'package:ecommerce/screens/home/components/categories.dart';
import 'package:ecommerce/screens/home/components/header.dart';
import 'package:ecommerce/screens/home/components/popular_products.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import 'banner_category.dart';

class Body extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"icon": "assets/icons/Flash Icon.svg", "text": "Flash deal", "name": ""},
    {"icon": "assets/icons/Game Icon.svg", "text": "Game", "name": ""},
    {"icon": "assets/icons/Bill Icon.svg", "text": "Bill", "name": ""},
    {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift", "name": ""},
    {"icon": "assets/icons/Discover.svg", "text": "More", "name": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateHeight(15),
              ),
              Header(),
              HomeBanner(),
              Categories(
                categories: categories,
              ),
              SizedBox(
                height: getProportionateHeight(10),
              ),
              buildLabelBanner(
                  label1: "Special for you", label2: "More", onTap: () {}),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BannerCategory(
                        image: "assets/images/Image Banner 2.png",
                        label: "Smartphone",
                        label2: "18 brands",
                        onPress: () {}),
                    BannerCategory(
                        image: "assets/images/Image Banner 3.png",
                        label: "Fashion",
                        label2: "24 brands",
                        onPress: () {}),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateHeight(15),
              ),
              buildLabelBanner(
                  label1: "Popular product", label2: "More", onTap: () {}),
              PopularProducts(),
              SizedBox(
                height: getProportionateHeight(13),
              ),
              Expanded(child: BottomBar())
            ],
          ),
        ));
  }

  Widget buildLabelBanner({Function onTap, String label1, String label2}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            label1,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          GestureDetector(
              onTap: onTap,
              child: Text(
                label2,
                style: TextStyle(fontSize: 15),
              ))
        ],
      ),
    );
  }
}
