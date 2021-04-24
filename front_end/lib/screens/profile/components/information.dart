import 'package:ecommerce/blocs/user_bloc.dart';
import 'package:ecommerce/components/avatar.dart';
import 'package:ecommerce/events/user_event.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/state/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

  UserBloc _userBloc;

  User user;

  @override
  void initState() {
    _userBloc = BlocProvider.of(context);
    _userBloc.add(UserEventInitial());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: _userBloc,
      listener: (context, state){
        if (state is UserStateInitial) {
          setState(() {
            user = state.user;
          });
        }
      },
      child: buildAvatar()
      );
  }
  
  Widget buildAvatar(){
    if (user != null){
      return Column(children: [
        Avatar(image: user.urlImage,),
        SizedBox(
          height: getProportionateHeight(15),
        ),
        Text('${user.name}', style: TextStyle(fontSize: getProportionateWidth(20)),)
      ],);
    }
    return Image.asset("assets/images/loading.gif", height: 100, width: 100,);
  }

}
