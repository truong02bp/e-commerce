
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {

  int id;
  String code;
  String name;

  Category({this.code, this.id, this.name});

  factory Category.fromJson(Map<String,dynamic> json) => _$CategoryFromJson(json);

  Map<String,dynamic> toJson() => _$CategoryToJson(this);

}