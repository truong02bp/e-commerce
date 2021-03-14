
class AuthenticationEvent {

}

class LogInEvent extends AuthenticationEvent {
  final String username;
  final String password;

  LogInEvent({this.username, this.password});

}


class LogOutEvent extends AuthenticationEvent {

}