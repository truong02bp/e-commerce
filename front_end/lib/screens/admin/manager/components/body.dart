import 'package:ecommerce/screens/admin/categories/category_screen.dart';
import 'package:ecommerce/screens/admin/products/product_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Manage category and product',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        SizedBox(
          height: getProportionateHeight(20),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed(ProductScreen.routeName);
                    },
                child: buildContainer(
                    image: "assets/images/list.png", text: 'List products'),
              )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, CategoryScreen.routeName);
                    },
                                      child: buildContainer(
                        image: "assets/images/list2.png",
                        text: 'List categories',
                        color: Colors.red,
                        colorImage: Colors.white.withOpacity(0.8)),
                  )),
              SizedBox(
                width: 10,
              )
            ],
          ),
        )
      ],
    );
  }

  Container buildContainer(
      {String image, String text, Color color, Color colorImage}) {
    return Container(
      height: getProportionateHeight(100),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: color == null
                  ? [
                      Colors.green.withOpacity(0.8),
                      Colors.green.withOpacity(0.4),
                    ]
                  : [color.withOpacity(0.8), color.withOpacity(0.4)]),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 75,
            color: colorImage != null ? colorImage : null,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
