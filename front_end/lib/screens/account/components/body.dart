import 'package:ecommerce/blocs/user_bloc.dart';
import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/events/user_event.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/screens/change_password/change_password_screen.dart';
import 'package:ecommerce/components/avatar.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/state/user_state.dart';
import 'package:flutter/material.dart';
import 'input_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  User user;

  UserBloc _userBloc;

  String name;

  DateTime _dateOfBirth;

  String phone;

  String address;

  bool isUpdateSuccess = false;

  bool isUpdateFailure = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      _userBloc = BlocProvider.of(context);
      _userBloc.add(UserEventInitial());
    });
    return BlocListener(
        cubit: _userBloc,
        listener: (context, state) {
          if (state is UserStateInitial) {
            setState(() {
              user = state.user;
            });
          } else if (state is UserStateUpdateSuccess) {
            setState(() {
              user = state.user;
              isUpdateSuccess = true;
              showUpdateMessage(context, isUpdateSuccess);
            });
          }
        },
        child: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    if (user != null)
      return Column(
        children: [
          SizedBox(
            height: getProportionateHeight(25),
          ),
          Avatar(
            image: user.urlImage,
          ),
          SizedBox(
            height: getProportionateHeight(15),
          ),
          Text(
            '${user.name}',
            style: TextStyle(
                fontSize: getProportionateWidth(25),
                color: Colors.black.withOpacity(0.7)),
          ),
          SizedBox(
            height: getProportionateHeight(15),
          ),
          InputCard(
              readOnly: true, initialValue: user.email, prefixText: "Email"),
          InputCard(
            onChange: (value) {
              setState(() {
                name = value;
              });
            },
            readOnly: false,
            initialValue: user.name,
            prefixText: "Name",
          ),
          buildDateOfBirthField(),
          InputCard(
            onChange: (value) {
              setState(() {
                address = value;
              });
            },
            readOnly: false,
            initialValue: user.address,
            prefixText: "Address",
          ),
          buildPhoneNumber(),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ChangePasswordScreen.routeName);
                  },
                  child: Text(
                    'Change password',
                    style: TextStyle(fontSize: getProportionateWidth(16)),
                  ),
                  color: Colors.redAccent.withOpacity(0.8),
                  height: getProportionateHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 13, left: 20, right: 20),
                ),
                FlatButton(
                  onPressed: () {
                    update();
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: getProportionateWidth(16)),
                  ),
                  color: Colors.redAccent.withOpacity(0.8),
                  height: getProportionateHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 13, left: 20, right: 20),
                ),
              ],
            ),
          )
        ],
      );
    return Image.asset(
      "assets/images/loading.gif",
      height: 100,
      width: 100,
    );
  }

  void update() {
    User updateUser = User(
        id: user.id,
        phone: phone,
        dateOfBirth: DateFormat('yyyy-MM-dd').format(_dateOfBirth),
        address: address,
        name: name);
    _userBloc.add(UserEventUpdate(user: updateUser));
  }

  Stack buildDateOfBirthField() {
    return Stack(children: [
      Positioned(child: Text('Date of birth', textAlign: TextAlign.left,style: TextStyle(color: Colors.black.withOpacity(0.45),)), bottom: 20, left: 40,),
      TextFormField(
        onTap: () {
          showDatePicker(
                  context: context,
                  initialDate: DateTime(2022),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2022))
              .then((value) => setState(() {
                    _dateOfBirth = value;
                  }));
        },
        decoration: InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(25)),
          enabledBorder:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(25)),
          errorBorder:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(25)),
          disabledBorder:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(25)),
          hintText: _dateOfBirth == null
              ? DateFormat('dd-MM-yyyy')
                  .format(DateTime.parse(user.dateOfBirth))
              : DateFormat('dd/MM/yyyy').format(_dateOfBirth),
          prefixStyle: TextStyle(
            color: Colors.black.withOpacity(0.45),
          ),
        ),
        textAlign: TextAlign.end,
      ),
    ]);
  }

  TextFormField buildPhoneNumber() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          phone = value;
        });
      },
      keyboardType: TextInputType.number,
      initialValue: "${user.phone}",
      decoration: InputCard.inputDecoration(prefixText: "Phone number"),
      textAlign: TextAlign.end,
    );
  }
}
