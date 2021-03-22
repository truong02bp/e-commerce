import 'package:ecommerce/blocs/sign_up_bloc.dart';
import 'package:ecommerce/components/custom_suffix_icons.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/screens/otp/otp.dart';
import 'package:ecommerce/screens/sign_up/sign_up.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CompleteForm extends StatefulWidget {
  @override
  _CompleteFormState createState() => _CompleteFormState();
}

class _CompleteFormState extends State<CompleteForm> {

  final _formKey = GlobalKey<FormState>();

  SignUpBloc _signUpBloc;


  @override
  void initState() {
    final Map<String,dynamic> args = ModalRoute.of(context).settings.arguments;
    _signUpBloc = args['bloc'];
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: _signUpBloc,
      listener: (context, state){

      },
      child: Form(
        key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                buildFirstNameField(),
                SizedBox(
                  height: getProportionateHeight(25),
                ),
                buildLastNameField(),
                SizedBox(
                  height: getProportionateHeight(25),
                ),
                buildPhoneNumberField(),
                SizedBox(
                  height: getProportionateHeight(25),
                ),
                buildAddressField(),
                SizedBox(
                  height: getProportionateHeight(25),
                ),
                DefaultButton(text: 'Continue', press: (){
                  if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.of(context).pushNamed(Otp.routeName);
                      }
                    })
              ],
            ),
          )
      ),
    );
  }

  TextFormField buildFirstNameField(){
    return TextFormField(
        validator: (value){
          if (value.isEmpty)
            return "First name must not empty";
          return null;
        },
        decoration: InputDecoration(
          labelText: 'First name',
          hintText: 'Enter your first name',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(image: "assets/icons/User.svg",)
        ),
    );
  }

  TextFormField buildLastNameField(){
    return TextFormField(
      validator: (value){
        if (value.isEmpty)
          return "Last name must not empty";
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Last name',
          hintText: 'Enter your last name',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(image: "assets/icons/User.svg",)
      ),
    );
  }

  TextFormField buildPhoneNumberField(){
    return TextFormField(
      validator: (value){
        if (value.isEmpty)
          return "Phone number must not empty";
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Phone number',
          hintText: 'Enter your phone number',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(image: "assets/icons/Phone.svg",)
      ),
    );
  }

  TextFormField buildAddressField(){
    return TextFormField(
      validator: (value){
        if (value.isEmpty)
          return "Address must not empty";
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Address',
          hintText: 'Enter your address',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(image: "assets/icons/Location point.svg",)
      ),
    );
  }

}
