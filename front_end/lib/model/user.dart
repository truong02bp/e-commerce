
class User {
  int id;
  String username;
  String password;
  String firstName;
  String lastName;
  String phone;
  String email;

  User(
      {this.id,
      this.username,
      this.password,
      this.firstName,
      this.lastName,
      this.phone,
      this.email});

  factory User.formJson(Map<String,dynamic> jsonMap){
    int id = jsonMap['id'] as int;
    return User(
      username: jsonMap["username"],
      password: jsonMap['password'],
      id : id,
      firstName : jsonMap['firstName'],
      lastName: jsonMap['lastName'],
      phone: jsonMap['phone'],
      email: jsonMap['email']
    );
  }
}