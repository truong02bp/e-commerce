import 'package:ecommerce/components/custom_banner.dart';
import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/screens/otp/components/otp_form.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomBanner(text: 'Otp verification'),
            SizedBox(
              height: getProportionateHeight(20),
            ),
            Text('We sent your code to 0964279710', textAlign: TextAlign.center,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('this code will be expired in :'),
                TweenAnimationBuilder(
                    tween: Tween(begin: 120.0, end: 0),
                    duration: Duration(seconds: 120),
                    builder: (context, value, child) => Text(' ${value.toInt()}', style: TextStyle(color: Colors.red),))
              ],
            ),
            Spacer(flex: 3,),
            OtpForm(),
            Spacer(flex: 3,),
            GestureDetector(
              onTap: (){

              },
              child: Text('Resend otp code', style: TextStyle(
                fontSize: getProportionateWidth(20),
                color: Colors.red
              ),),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
