import 'dart:io';

import 'package:ecommerce/blocs/user_bloc.dart';
import 'package:ecommerce/constants/api_constant.dart';
import 'package:ecommerce/events/user_event.dart';
import 'package:ecommerce/state/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../size_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Avatar extends StatefulWidget {
  final String image;

  Avatar({this.image});

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final ImagePicker _picker = ImagePicker();
  PickedFile _image;
  String imageUrl;
  UserBloc _userBloc;

  @override
  void initState() {
    _userBloc = BlocProvider.of(context);
    imageUrl = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: _userBloc,
      listener: (context, state) {
        if (state is UserStateUpdateAvatarSuccess) {
          setState(() {
            imageUrl = state.imageUrl;
          });
        }
      },
      child: Center(
        child: SizedBox(
          height: getProportionateHeight(150),
          width: getProportionateWidth(150),
          child: Stack(
              fit: StackFit.expand,
              overflow: Overflow.visible,
              children: [
                CircleAvatar(
                  backgroundImage: _image == null
                      ? NetworkImage("$minioUrl$imageUrl")
                      : FileImage(File(_image.path)),
                ),
                Positioned(
                  right: -10,
                  bottom: 0,
                  child: SizedBox(
                    height: getProportionateHeight(40),
                    width: getProportionateWidth(40),
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Colors.white)),
                      color: Color(0xFFF5F6F9),
                      onPressed: () {
                        showChoisePickImage();
                      },
                      child: SvgPicture.asset(
                        "assets/icons/Camera Icon.svg",
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(left: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Are you sure about this update ? ',),
            FlatButton(
                onPressed: (){
                  _userBloc.add(
                      UserEventUpdateAvatar(image: _image));
                   Navigator.of(context).pop();   
                },
                child: Text('Yes')),
            FlatButton(
                onPressed: () {
                  setState(() {
                    _image = null;
                  });
                  Navigator.of(context).pop();
                },
                child: Text('No')),
          ],
        ),
      ),
    );
  }

  void showChoisePickImage() {
    AlertDialog alert = AlertDialog(
      title: Text(
        'Choose from camera or gallery',
        style: TextStyle(fontSize: 17),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                getImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
              child: Image.asset(
                "assets/images/camera.png",
                height: 70,
                width: 70,
              ),
            ),
            GestureDetector(
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
                child: Image.asset("assets/images/gallery.png",
                    height: 70, width: 70))
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (context) => alert);
  }

  void getImage(ImageSource source) async {
    final imagePicked = await _picker.getImage(source: source);
    setState(() {
      _image = imagePicked;
    });
    if (_image != null)
      showModalBottomSheet(
          context: context, builder: (context) => bottomSheet());
  }
}
