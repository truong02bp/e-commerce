
import 'package:ecommerce/model/user.dart';

class UserState {

}

class UserStateInitial extends UserState {

  final User user;

  UserStateInitial({this.user});

}

class UserStateUpdateSuccess extends UserState {
  
  final User user;

  UserStateUpdateSuccess({this.user});

}

class UserStateUpdateFailure extends UserState {

}
