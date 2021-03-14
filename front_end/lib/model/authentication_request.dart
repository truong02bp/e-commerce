class AuthenticationRequest {
  final String username;
  final String password;

  AuthenticationRequest({this.username, this.password});

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };

}