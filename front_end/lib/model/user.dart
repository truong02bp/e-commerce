
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable(explicitToJson: true)
class User {
  int id;
  String username;
  String password;
  String firstName;
  String lastName;
  String phone;
  String email;
  String address;
  String urlImage;
  
  User(
      {this.id,
      this.username,
      this.password,
      this.firstName,
      this.lastName,
      this.phone,
      this.email, this.address, this.urlImage});
  factory User.fromJson(Map<String,dynamic> jsonMap) => _$UserFromJson(jsonMap);
  Map<String,dynamic> toJson() => _$UserToJson(this);
}