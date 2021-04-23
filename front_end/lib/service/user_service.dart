import 'dart:convert';

import 'package:ecommerce/constants/api_constant.dart';
import 'package:ecommerce/model/api_model.dart';
import 'package:ecommerce/model/image.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/service/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class UserService {

  ApiService apiService = ApiService();

  String apiUrl = baseUrl +"/user";

  void create(User user) async {
    try {
      Map<String, String> headers = Map();
      headers["Content-Type"] = "application/json";
      final res = await http.post(apiUrl,
          body: jsonEncode(user), headers: headers);
      
      if (res.statusCode != 200) throw new Exception(res.statusCode.toString());
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  Future<User> update(User user) async {
    Map<String, String> headers = Map();
    headers["Content-Type"] = "application/json";
    ApiModel<User> apiModel = ApiModel(
        url: apiUrl,
        body: user,
        headers: headers,
        parse: (response) {
          String data = Utf8Decoder().convert(response.bodyBytes);
          final jsonData = jsonDecode(data);
          return User.fromJson(jsonData);
        });
    User res = await apiService.put(apiModel);
    if (res != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("user", jsonEncode(res));
    }
    return res;
  }
  Future<User> updateAvatar({int id, Image image}) async{
    Map<String,String> headers = Map();
    headers["Content-Type"] = "application/json";
    ApiModel<User> apiModel = ApiModel(
      url : apiUrl + "/update-avatar/$id",
      body: image,
      headers: headers,
      parse: (response) {
        String data = Utf8Decoder().convert(response.bodyBytes);
          final jsonData = jsonDecode(data);
          return User.fromJson(jsonData);
      }
    );
    User res = await apiService.put(apiModel);
    if (res != null){
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("user", jsonEncode(res));
    }
    return res;
  }

  Future<User> updatePassword({User user}) async{
    Map<String,String> headers = Map();
    headers["Content-Type"] = "application/json";
    ApiModel<User> apiModel = ApiModel(
      url : apiUrl + "/update-password",
      body: user,
      headers: headers,
      parse: (response) {
        String data = Utf8Decoder().convert(response.bodyBytes);
          final jsonData = jsonDecode(data);
          return User.fromJson(jsonData);
      }
    );
    User res = await apiService.put(apiModel);
    if (res != null){
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("user", jsonEncode(res));
    }
    return res;
  }
}
