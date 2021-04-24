import 'package:ecommerce/blocs/sign_up_bloc.dart';
import 'package:ecommerce/components/custom_suffix_icons.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/events/sign_up_event.dart';
import 'package:ecommerce/screens/otp/otp.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/state/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
class CompleteForm extends StatefulWidget {
  @override
  _CompleteFormState createState() => _CompleteFormState();
}

class _CompleteFormState extends State<CompleteForm> {
  final _formKey = GlobalKey<FormState>();

  SignUpBloc _signUpBloc;

  String _name;
  DateTime _dateOfBirth;
  String _phoneNumber;
  String _address;

  bool isLoading = false;

  @override
  void initState() {
    _signUpBloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: _signUpBloc,
      listener: (context, state) {
        if (state is SignUpStepSecondStateSuccess) {
          Navigator.of(context).push(MaterialPageRoute<Otp>(
              builder: (context) => BlocProvider.value(
                    value: _signUpBloc,
                    child: Otp(),
                  )));
        }
        else
          if (state is SignUpLoading){
            setState(() {
              isLoading = true;
            });
          }
      },
      child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                buildNameField(),
                SizedBox(
                  height: getProportionateHeight(25),
                ),
                buildDateOfBirthField(),
                SizedBox(
                  height: getProportionateHeight(25),
                ),
                buildPhoneNumberField(),
                SizedBox(
                  height: getProportionateHeight(25),
                ),
                buildAddressField(),
                SizedBox(
                  height: getProportionateHeight(10),
                ),
                buildLoading(isLoading: isLoading),
                SizedBox(
                  height: getProportionateHeight(15),
                ),
                DefaultButton(
                    text: 'Continue',
                    press: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _signUpBloc.add(CompleteStepSecondEvent(dateOfBirth: _dateOfBirth, name: _name, phoneNumber: _phoneNumber, address: _address));
                      }
                    }),
              ],
            ),
          )),
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      onChanged: (value) {
        _name = value;
      },
      validator: (value) {
        if (value.isEmpty) return "Name must not empty";
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Name',
          hintText: 'Enter your name',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            image: "assets/icons/User.svg",
          )),
    );
  }

  TextFormField buildDateOfBirthField() {
    return TextFormField(
      onTap: (){
        showDatePicker(context: context, initialDate: DateTime(2022), firstDate: DateTime(1900), lastDate: DateTime(2022))
        .then((value) => setState((){
          _dateOfBirth = value;
        }));
      },
      decoration: InputDecoration(
          labelText: 'Date of birth',
          hintText: _dateOfBirth == null ? 'Enter your date of birth' : DateFormat('dd/MM/yyyy').format(_dateOfBirth),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            image: "assets/icons/User.svg",
          )),
    );
  }

  TextFormField buildPhoneNumberField() {
    return TextFormField(
      onChanged: (value) {
        _phoneNumber = value;
      },
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) return "Phone number must not empty";
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Phone number',
          hintText: 'Enter your phone number',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            image: "assets/icons/Phone.svg",
          )),
    );
  }

  TextFormField buildAddressField() {
    return TextFormField(
      onChanged: (value) {
        _address = value;
      },
      validator: (value) {
        if (value.isEmpty) return "Address must not empty";
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Address',
          hintText: 'Enter your address',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            image: "assets/icons/Location point.svg",
          )),
    );
  }
}
