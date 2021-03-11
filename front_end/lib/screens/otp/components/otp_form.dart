import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: getProportionateWidth(50),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        decoration: otpDecoration,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateWidth(50),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        decoration: otpDecoration,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateWidth(50),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        decoration: otpDecoration,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateWidth(50),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        decoration: otpDecoration,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateHeight(20),),
                DefaultButton(text: 'Continue', press: () {}),
              ],
            ),
          )),
    );
  }
}
