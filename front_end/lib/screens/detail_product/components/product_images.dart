import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductImages extends StatefulWidget {
  final List<String> images;

  ProductImages({this.images});

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  CarouselController buttonCarouselController = CarouselController();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final images = widget.images;
    return Column(
      children: [
        CarouselSlider(
          items: List.generate(
              images.length, (index) => Image.asset(images[index])),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            height: getProportionateHeight(350),
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 0,
            onPageChanged: (index, reason) => {
              setState(() {
                selectedIndex = index;
              })
            },
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                images.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildSmallProductPreview(index),
                    )),
          ),
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          buttonCarouselController.jumpToPage(index);
        });
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 0),
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateHeight(50),
        width: getProportionateWidth(50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedIndex == index ? 1 : 0)),
        ),
        child: Image.asset(widget.images[index]),
      ),
    );
  }
}
