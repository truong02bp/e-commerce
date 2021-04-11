
import 'package:ecommerce/model/user.dart';

class AuthenticationState {

}

class AuthenticationStateSuccess extends AuthenticationState {

  final User user;

  AuthenticationStateSuccess({this.user});

}

class AuthenticationStateFailure extends AuthenticationState {

  
}