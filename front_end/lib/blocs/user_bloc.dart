import 'dart:convert';

import 'package:ecommerce/events/user_event.dart';
import 'package:ecommerce/model/image.dart';
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
      User user = User.fromJson(jsonDecode(preferences.getString("user")));
      yield UserStateInitial(user: user);
    }
    else 
      if (event is UserEventUpdate){
        User user = await userService.update(event.user);
        yield UserStateUpdateSuccess(user: user);
      }
      else 
        if (event is UserEventUpdateAvatar){
          List<int> bytes = await event.image.readAsBytes();
          String baseImage = base64Encode(bytes);
          Image image = Image(bytes : baseImage, type: "jpg");
          SharedPreferences preferences = await SharedPreferences.getInstance();
          User user = User.fromJson(jsonDecode(preferences.getString("user")));
          user = await userService.updateAvatar(id: user.id, image: image);
          print(user);
          yield UserStateUpdateAvatarSuccess(imageUrl: user.urlImage);
            // User newUser = User()
        }
  }

}