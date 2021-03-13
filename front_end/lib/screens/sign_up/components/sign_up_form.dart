import 'package:ecommerce/components/custom_suffix_icons.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/screens/complete_profile/complete_profile.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email,password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateHeight(25),
          ),
          buildEmailFormField(),
          SizedBox(
            height: getProportionateWidth(25),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateWidth(25),
          ),
          buildPasswordConfirmFormField(),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateHeight(25),
          ),
          DefaultButton(text: 'Continue', press: (){
            if (_formKey.currentState.validate()){
              _formKey.currentState.save();
              Navigator.of(context).pushNamed(CompleteProfile.routeName);
            }
          })
        ],
      ),
    ));
  }

  TextFormField buildEmailFormField(){
    return TextFormField(
      onChanged: (value) {
        email = value;
        if (value.isNotEmpty && errors.contains(EMPTY_EMAIL_ERROR)) {
          removeError(error: EMPTY_EMAIL_ERROR);
        }
        if (emailRegExp.hasMatch(value) &&
            errors.contains(EMAIL_INVALID_ERROR)) {
          removeError(error: EMAIL_INVALID_ERROR);
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          if (!errors.contains(EMPTY_EMAIL_ERROR)) {
            setState(() {
              if (errors.contains(EMAIL_INVALID_ERROR))
                errors.remove(EMAIL_INVALID_ERROR);
              errors.add(EMPTY_EMAIL_ERROR);
            });
          }
          return "";
        } else if (!emailRegExp.hasMatch(value)) {
          if (!errors.contains(EMAIL_INVALID_ERROR))
              addError(error: EMAIL_INVALID_ERROR);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: 'Enter your email',
          labelText: 'Email',
          suffixIcon: CustomSuffixIcon(image :'assets/icons/Mail.svg')),
    );
  }

  TextFormField buildPasswordFormField(){
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        password = value;
        if (value.isNotEmpty && errors.contains(EMPTY_PASSWORD_ERROR)) {
          removeError(error: EMPTY_PASSWORD_ERROR);
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          if (!errors.contains(EMPTY_PASSWORD_ERROR))
            addError(error: EMPTY_PASSWORD_ERROR);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: 'Enter your password',
          labelText: 'Password',
          suffixIcon: CustomSuffixIcon(
            image: 'assets/icons/Lock.svg',
          )),
    );
  }

  TextFormField buildPasswordConfirmFormField(){
    return TextFormField(
      validator: (value){
        if (value != password){
          addError(error: CONFIRM_PASSWORD_ERROR);
          return "";
        }
        return null;
      },
      onChanged: (value){
        removeError(error: CONFIRM_PASSWORD_ERROR);
      },
      obscureText: true,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: 'Confirm your password',
          labelText: 'Confirm password',
          suffixIcon: CustomSuffixIcon(
            image: 'assets/icons/Lock.svg',
          )),
    );
  }

  void addError({error}){
    if (!errors.contains(error))
      setState(() {
        errors.add(CONFIRM_PASSWORD_ERROR);
      });
  }

  void removeError({error}){
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

}
