import 'package:ecommerce/blocs/authentication_bloc.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/events/authenticateion_event.dart';
import 'package:ecommerce/screens/forgot_password/forgot_password.dart';
import 'package:ecommerce/screens/login_success/login_success.dart';
import 'package:ecommerce/state/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/constants.dart';
import '../../../size_config.dart';
import '../../../components/custom_suffix_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  bool isRememberMe = false;
  String _username;
  String _password;
  AuthenticationBloc _authBloc;

  @override
  void initState() {
    _authBloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: _authBloc,
      listener: (context, AuthenticationState state){
        if (state is AuthenticationStateSuccess && state.user != null){
          Navigator.pushNamed(context, LoginSuccess.routeName);
        }
      },
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty && errors.contains(EMPTY_EMAIL_ERROR))
                      errors.remove(EMPTY_EMAIL_ERROR);
                    if (emailRegExp.hasMatch(value) &&
                        errors.contains(EMAIL_INVALID_ERROR))
                      errors.remove(EMAIL_INVALID_ERROR);
                    _username = value;
                  });
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
                    return "";
                  } else if (!emailRegExp.hasMatch(value)) {
                    if (!errors.contains(EMAIL_INVALID_ERROR))
                      setState(() {
                        message = EMAIL_INVALID_ERROR;
                        errors.add(message);
                      });
                    return "";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  suffixIcon: CustomSuffixIcon(
                    image: "assets/icons/Mail.svg",
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateHeight(20),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty && errors.contains(EMPTY_PASSWORD_ERROR))
                      errors.remove(EMPTY_PASSWORD_ERROR);
                    _password = value;
                  });
                },
                validator: (value) {
                  String message = "";
                  if (value.isEmpty) {
                    message = EMPTY_PASSWORD_ERROR;
                    if (!errors.contains(message))
                      setState(() {
                        errors.add(message);
                      });
                    return "";
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  suffixIcon: CustomSuffixIcon(
                    image: "assets/icons/Lock.svg",
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateHeight(20),
              ),
              FormError(errors: errors),
              SizedBox(
                height: getProportionateHeight(10),
              ),
              Row(
                children: [
                  Checkbox(
                      value: isRememberMe,
                      onChanged: (value) {
                        setState(() {
                          isRememberMe = value;
                        });
                      }),
                  Text('Remember me'),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(ForgotPassword.routeName);
                      },
                      child: Text(
                        'Forgot password',
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              ),
              SizedBox(
                height: getProportionateHeight(40),
              ),
              DefaultButton(
                text: 'Continue',
                press: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print(_username + " " + _password);
                    _authBloc.add(LogInEvent(username: _username, password: _password));
                  }
                },
              ),
            ],
          )),
    );
  }
}
