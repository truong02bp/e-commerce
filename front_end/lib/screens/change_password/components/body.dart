import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Old password',
                labelText: 'Old password',
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          SizedBox(
            height: getProportionateHeight(50),
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'New password',
                labelText: 'New password',
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          SizedBox(height: 50,),
          FlatButton(
            onPressed: () {},
            child: Text('Change password', style : TextStyle(fontSize: 18)),
            color: Colors.redAccent.withOpacity(0.8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.only(top: 10, bottom: 13, left: 20, right: 20),
          )
        ],
      ),
    );
  }
}
