import 'package:ecommerce/blocs/user_bloc.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/events/user_event.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/state/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  UserBloc _userBloc;
  String oldPassword;
  String newPassword;
@override
void initState() { 
  super.initState();
  _userBloc = BlocProvider.of(context);
}

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: _userBloc,
      listener: (context, state) {
        if (state is UserStateUpdatePasswordSuccess){
              showUpdateMessage(context,true);
              Navigator.of(context).pop();
        }

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value){
                setState(() {
                oldPassword = value;
                  
                });
              },
              decoration: InputDecoration(
                  hintText: 'Old password',
                  labelText: 'Old password',
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            SizedBox(
              height: getProportionateHeight(50),
            ),
            TextFormField(
              onChanged: (value){
                setState(() {
                  newPassword = value;
                });
              },
              decoration: InputDecoration(
                  hintText: 'New password',
                  labelText: 'New password',
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              onPressed: () {
                _userBloc.add(UserEventChangePassword(oldPassword : oldPassword, newPassword: newPassword));
              },
              child: Text('Change password', style: TextStyle(fontSize: 18)),
              color: Colors.redAccent.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              padding:
                  EdgeInsets.only(top: 10, bottom: 13, left: 20, right: 20),
            )
          ],
        ),
      ),
    );
  }
}
