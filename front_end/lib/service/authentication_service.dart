
import 'dart:convert';

import 'package:ecommerce/constants/api_constant.dart';
import 'package:ecommerce/model/api_model.dart';
import 'package:ecommerce/model/authentication_request.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {

  ApiService apiService = ApiService();

  Future<String> authenticate(String username, String password) async {
    Map<String, String> headers = Map();
    headers["Content-Type"] = "application/json;charset=UTF-8";
    ApiModel apiModel = new ApiModel(
        body: AuthenticationRequest(username: username, password: password),
        headers: headers,
        url: baseUrl + "/authenticate");    
    String token = await apiService.post(apiModel);
    if (token != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("token",token);
    }
    return token;
  }

  Future<User> getUserInfor(String token) async {
    Map<String, String> headers = Map();
    headers["Content-Type"] = "application/json";
    headers['Authorization'] = token;
    ApiModel<User> apiModel = ApiModel(
        url: baseUrl + "/user",
        headers: headers,
        parse: (response) {
          String data = Utf8Decoder().convert(response.bodyBytes);
          final jsonData = jsonDecode(data);
          return User.fromJson(jsonData);
        });
    User user = await apiService.load(apiModel);
    if (user != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("user", jsonEncode(user));
    }
    return user;
  }
}