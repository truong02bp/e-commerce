import 'package:ecommerce/blocs/sign_up_bloc.dart';
import 'package:ecommerce/components/custom_suffix_icons.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/events/sign_up_event.dart';
import 'package:ecommerce/screens/complete_profile/complete_profile.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/state/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String _email, _password, _username;
  SignUpBloc _signUpBloc;
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
        setState(() {
          isLoading = false;
        });
        if (state is SignUpStateCheckExisted) {
          setState(() {
            if (!errors.contains(state.message)) {
              errors.add(state.message);
            }
          });
        } else {
          if (state is SignUpStepOneStateSuccess) {
            Navigator.pushNamed(context, CompleteProfile.routeName, arguments: {
              'bloc' : BlocProvider.of(context)
            });
          }
          if (state is SignUpLoading) {
            setState(() {
              isLoading = true;
            });
          }
        }
      },
      child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateHeight(25),
                ),
                buildEmailFormField(),
                SizedBox(
                  height: getProportionateWidth(25),
                ),
                buildUsernameFormField(),
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
                DefaultButton(
                    text: 'Continue',
                    press: () {
                      print("click");
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _signUpBloc.add(CompleteStepOneEvent(
                            email: _email,
                            username: _username,
                            password: _password));
                      }
                    }),
                buildLoading()
              ],
            ),
          )),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onChanged: (value) {
        _email = value;
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
          suffixIcon: CustomSuffixIcon(image: 'assets/icons/Mail.svg')),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      onChanged: (value) {
        _username = value;
        if (value.isNotEmpty && errors.contains(EMPTY_EMAIL_ERROR)) {
          removeError(error: EMPTY_EMAIL_ERROR);
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
        }
        return null;
      },
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: 'Enter your username',
          labelText: 'Username',
          suffixIcon: CustomSuffixIcon(image: 'assets/icons/User.svg')),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        _password = value;
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

  TextFormField buildPasswordConfirmFormField() {
    return TextFormField(
      validator: (value) {
        if (value != _password) {
          addError(error: CONFIRM_PASSWORD_ERROR);
          return "";
        }
        return null;
      },
      onChanged: (value) {
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

  void addError({error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  Widget buildLoading() {
    if (isLoading)
      return SizedBox(
        width: double.infinity,
        child: Image.asset(
          "assets/images/loading.gif",
          height: getProportionateHeight(100),
          width: getProportionateWidth(100),
        ),
      );
    return Container();
  }
}
