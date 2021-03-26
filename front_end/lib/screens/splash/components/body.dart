import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/sign_in/sign_in.dart';
import 'package:ecommerce/screens/splash/components/splash_content.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  List<Map<String,String>> values = [
    {
      "text" : 'Welcome to ToKoTo, Let\'s shop!',
      "image" : 'assets/images/splash_1.png'
    },
    {
      "text": 'We help people contact with store\naround United State Of America',
      "image": 'assets/images/splash_2.png'
    },
    {
      "text": 'We show the easy way to shop\nStay at home with us',
      "image": 'assets/images/splash_3.png',
    }
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value){
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context,index){
                return SplashContent(
                  text: values[index]['text'],
                  image: values[index]['image'],
                );
              },
              itemCount: values.length,)),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      children: List.generate(values.length, (index) => buildDot(index: index)),
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Spacer(flex: 3,),
                    DefaultButton(
                      text: 'Continute',
                      press: (){
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                    ),
                    Spacer()
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  Container buildDot({index}){
    return Container(
      height: 8,
      width: currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : kTextColor,
          borderRadius: BorderRadius.circular(20)
      ),
    );
  }

}






