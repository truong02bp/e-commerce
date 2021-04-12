import 'package:ecommerce/model/user.dart';

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