import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/screens/change_password/change_password_screen.dart';
import 'package:ecommerce/components/avatar.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'input_card.dart';
class Body extends StatelessWidget {
  final User user = User(
      email: "truong02.bp@gmail",
      username: "abc",
      firstName: "demo",
      lastName: "demo",
      phone: "0932",
      address: "halo");
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _addressController;
  TextEditingController _phoneController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateHeight(25),
        ),
        Avatar(image: "http://localhost:9000/minio/images/avatar/avatar_user_3.jpg",),
        SizedBox(
          height: getProportionateHeight(15),
        ),
        Text('${user.firstName} ${user.lastName}', style: TextStyle(fontSize: getProportionateWidth(25), color: Colors.black.withOpacity(0.7)),),
        SizedBox(
          height: getProportionateHeight(15),
        ),
        InputCard(readOnly: true, initialValue: user.email, prefixText: "Email"),
        InputCard(readOnly: false, initialValue: user.firstName, prefixText: "First Name", controller: _firstNameController),
        InputCard(readOnly: false, initialValue: user.lastName, prefixText: "Last Name", controller: _lastNameController),
        InputCard(readOnly: false, initialValue: user.address, prefixText: "Address", controller: _addressController),
        buildPhoneNumber(),
        SizedBox(height: 25,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context, ChangePasswordScreen.routeName);
                },
                child: Text('Change password', style: TextStyle(fontSize: getProportionateWidth(16)),),
                color: Colors.redAccent.withOpacity(0.8),
                height: getProportionateHeight(50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.only(top: 10, bottom: 13, left: 20, right: 20),
              ),
              FlatButton(
                onPressed: (){},
                child: Text('Update', style: TextStyle(fontSize: getProportionateWidth(16)),),
                color: Colors.redAccent.withOpacity(0.8),
                height: getProportionateHeight(50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.only(top: 10, bottom: 13, left: 20, right: 20),
              ),
            ],
          ),
        )
      ],
    );
  }

  

  TextFormField buildPhoneNumber() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.number,
      initialValue: "${user.phone}",
      decoration: InputCard.inputDecoration(prefixText: "Phone number"),
      textAlign: TextAlign.end,
    );
  }
}
