
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable(explicitToJson: true)
class User {
  int id;
  String username;
  String password;
  String name;
  String phone;
  String email;
  String address;
  String urlImage;
  String dateOfBirth;
  String newPassword;
  User(
      {this.id,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.email, this.address, this.urlImage, this.newPassword, this.dateOfBirth});
  factory User.fromJson(Map<String,dynamic> jsonMap) => _$UserFromJson(jsonMap);
  Map<String,dynamic> toJson() => _$UserToJson(this);
}