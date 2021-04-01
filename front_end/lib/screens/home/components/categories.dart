import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {

  final List<Map<String, dynamic>> categories;


  Categories({this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () {},
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
