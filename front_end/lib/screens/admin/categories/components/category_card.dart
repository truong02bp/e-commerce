import 'package:ecommerce/model/category.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {

  final Category category;

  CategoryCard({this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: getProportionateHeight(100),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(
              width: getProportionateWidth(20),
            ),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45), color: Colors.red),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/product 1 image.png"),
              ),
            ),
            SizedBox(
              width: getProportionateWidth(20),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name : ${category.name}'),
                Text('Code : ${category.code}'),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
