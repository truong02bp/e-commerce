import 'package:ecommerce/blocs/sign_up_bloc.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/events/sign_up_event.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {

  final _formKey = GlobalKey<FormState>();

  SignUpBloc _signUpBloc;

  List<String> otp = List(4);

  @override
  void initState() {
    _signUpBloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: _signUpBloc,
      listener: (context,state){

      },
      child: SizedBox(
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
                          onChanged: (value){
                            otp[0] = value;
                          },
                          style: TextStyle(fontSize: 20),
                          decoration: otpDecoration,
                        ),
                      ),
                      SizedBox(
                        width: getProportionateWidth(50),
                        child: TextFormField(
                          onChanged: (value){
                            otp[1] = value;
                          },
                          style: TextStyle(fontSize: 20),
                          decoration: otpDecoration,
                        ),
                      ),
                      SizedBox(
                        width: getProportionateWidth(50),
                        child: TextFormField(
                          onChanged: (value){
                            otp[2] = value;
                          },
                          style: TextStyle(fontSize: 20),
                          decoration: otpDecoration,
                        ),
                      ),
                      SizedBox(
                        width: getProportionateWidth(50),
                        child: TextFormField(
                          onChanged: (value){
                            otp[3] = value;
                          },
                          style: TextStyle(fontSize: 20),
                          decoration: otpDecoration,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateHeight(20),),
                  DefaultButton(text: 'Continue', press: () {
                    String res = "";
                    otp.forEach((element) { res+=element; });
                    _signUpBloc.add(SubmitOtpEvent(otp: res));
                  }),
                ],
              ),
            )),
      ),
    );
  }
}
