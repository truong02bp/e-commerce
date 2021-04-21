
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable(explicitToJson: true)
class Image {
  
  String bytes;
  String type;

  Image({this.bytes,this.type});

  factory Image.fromJson(Map<String,dynamic> json) => _$ImageFromJson(json);

  Map<String,dynamic> toJson() => _$ImageToJson(this);

}