import 'dart:convert';

import 'package:ecommerce/events/user_event.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/service/user_service.dart';
import 'package:ecommerce/state/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserBloc extends Bloc<UserEvent,UserState> {

  UserBloc() : super(UserStateInitial());

  UserService userService = UserService();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserEventInitial) {
    SharedPreferences preferences = await SharedPreferences.getInstance();
      User user = User.formJson(jsonDecode(preferences.getString("user")));
      yield UserStateInitial(user: user);
    }
    else 
      if (event is UserEventUpdate){
        User user = await userService.update(event.user);
        yield UserStateUpdateSuccess(user: user);
      }
      else 
        if (event is UserEventUpdateAvatar){
            User newUser = User()
        }
  }

}