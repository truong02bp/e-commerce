import 'package:ecommerce/components/account_question.dart';
import 'package:ecommerce/components/custom_banner.dart';
import 'package:ecommerce/components/custom_suffix_icons.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  String email;
  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomBanner(text: 'Forgot Password'),
            SizedBox(
              height: getProportionateHeight(20),
            ),
            Text(
              'Please enter your email and we will send a link to return to your account',
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 2,
            ),
            Form(
                key: _formKey,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.isNotEmpty && errors.contains(EMPTY_EMAIL_ERROR)) {
                      setState(() {
                        errors.remove(EMPTY_EMAIL_ERROR);
                      });
                    }
                    if (emailRegExp.hasMatch(value) &&
                        errors.contains(EMAIL_INVALID_ERROR)) {
                      setState(() {
                        errors.remove(EMAIL_INVALID_ERROR);
                      });
                    }
                    email = value;
                  },
                  validator: (value) {
                    String message = "";
                    if (value.isEmpty) {
                      message = EMPTY_EMAIL_ERROR;
                      if (!errors.contains(message)) {
                        setState(() {
                          if (errors.contains(EMAIL_INVALID_ERROR))
                            errors.remove(EMAIL_INVALID_ERROR);
                          errors.add(message);
                        });
                      }
                    } else if (!emailRegExp.hasMatch(value) &&
                        !errors.contains(EMAIL_INVALID_ERROR)) {
                      setState(() {
                        message = EMAIL_INVALID_ERROR;
                        errors.add(message);
                      });
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Enter your email',
                      labelText: 'Enter your email',
                      suffixIcon: CustomSuffixIcon(
                        image: 'assets/icons/Mail.svg',
                      )),
                )),
            Spacer(
              flex: 2,
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateHeight(10),),
            DefaultButton(
              text: 'Continue',
              press: () {
                if (_formKey.currentState.validate())
                  _formKey.currentState.save();
              },
            ),
            Spacer(
              flex: 2,
            ),
            AccountQuestion(),
            Spacer()
          ],
        ),
      ),
    ));
    ;
  }
}
