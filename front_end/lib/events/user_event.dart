import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/state/user_state.dart';
import 'package:image_picker/image_picker.dart';
class UserEvent {

}

class UserEventInitial extends UserEvent {

}

class UserEventGetInfor extends UserEvent {

}

class UserEventUpdate extends UserEvent {

  final User user;

  UserEventUpdate({this.user});

}

class UserEventUpdateAvatar extends UserEvent {
  
  final PickedFile image;

  UserEventUpdateAvatar({this.image});

}

class UserEventChangePassword extends UserEvent {
  
  final String oldPassword;

  final String newPassword;

  UserEventChangePassword({this.newPassword, this.oldPassword});

}