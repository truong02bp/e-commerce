
class User {
  int id;
  String username;
  String password;
  String firstName;
  String lastName;
  String phone;
  String email;
  String address;
  
  User(
      {this.id,
      this.username,
      this.password,
      this.firstName,
      this.lastName,
      this.phone,
      this.email, this.address});

  factory User.formJson(Map<String,dynamic> jsonMap){
    int id = jsonMap['id'] as int;
    return User(
      username: jsonMap["username"],
      password: jsonMap['password'],
      id : id,
      firstName : jsonMap['firstName'],
      lastName: jsonMap['lastName'],
      phone: jsonMap['phone'],
      email: jsonMap['email'],
      address: jsonMap['address']
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'username': username,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'address': address,
        'email': email,
      };
}