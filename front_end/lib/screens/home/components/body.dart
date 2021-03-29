import 'package:ecommerce/components/icon_btn_counter.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  List<Map<String, dynamic>> categories = [
    {"icon": "assets/icons/Flash Icon.svg", "text": "Flash deal" , "name" : ""},
    {"icon": "assets/icons/Game Icon.svg", "text": "Game", "name" : ""},
    {"icon": "assets/icons/Bill Icon.svg", "text": "Bill", "name" : ""},
    {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift", "name" : ""},
    {"icon": "assets/icons/Discover.svg", "text": "More", "name" : ""},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateHeight(15),
          ),
          buildHeader(),
          buildBanner(),
          buildCategories(context),
          SizedBox(height: getProportionateHeight(10),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Special for you', style: TextStyle(fontSize: 20, color: Colors.black),),
                Text('More')
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget buildHeader() {
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
          IconBtnWithCounter(
            icon: "assets/icons/Cart Icon.svg",
            counter: 3,
            onPress: () {},
          ),
          IconBtnWithCounter(
            icon: "assets/icons/Bell.svg",
            counter: 3,
            onPress: () {},
          )
        ],
      ),
    );
  }

  Widget buildBanner() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      height: 90,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateWidth(20),
          vertical: getProportionateHeight(8)),
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)),
      child: Text.rich(TextSpan(
          text: 'A summer surpise\n',
          style: TextStyle(fontSize: 18, color: Colors.white),
          children: [
            TextSpan(text: 'Cashback 20%', style: TextStyle(fontSize: 24))
          ])),
    );
  }

  Widget buildCategories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(categories.length, (index){
          return GestureDetector(
            onTap: (){

            },
            child: SizedBox(
              width: getProportionateWidth(40),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                        padding: EdgeInsets.all(getProportionateWidth(10)),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFECDF),
                            borderRadius: BorderRadius.circular(10)),
                        child: SvgPicture.asset(categories[index]["icon"])),
                  ),
                  Text(
                    categories[index]["text"],
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
