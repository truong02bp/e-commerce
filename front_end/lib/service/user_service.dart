import 'dart:convert';

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/model/api_model.dart';
import 'package:ecommerce/model/authentication_request.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/service/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class UserService {
  ApiService apiService = ApiService();

  Future<String> sendOtp(
      {String email, String firstName, String lastName}) async {
    try {
      final res = await http.post(baseUrl +
          "/user/otp?" +
          "email=" +
          email +
          "&firstName=" +
          firstName +
          "&lastName=" +
          lastName);
      if (res.statusCode == 200) {
        return res.body;
      } else
        throw new Exception(res.statusCode.toString());
    } catch (exception) {
      throw new Exception(exception.toString());
    }
  }

  Future<bool> isEmailExisted({String email}) async {
    try {
      final res = await http.post(baseUrl + "/user/check-email?email=" + email);
      if (res.body == "true") return true;
      return false;
    } catch (exception) {
      throw new Exception(exception.toString());
    }
  }

  Future<bool> isUsernameExisted({String username}) async {
    try {
      final res = await http
          .post(baseUrl + "/user/check-username?username=" + username);
      if (res.body == "true") return true;
      return false;
    } catch (exception) {
      throw new Exception(exception.toString());
    }
  }

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
          return User.formJson(jsonData);
        });
    User user = await apiService.load(apiModel);
    if (user != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("user", jsonEncode(user));
    }
    return user;
  }

  void create(User user) async {
    try {
      Map<String, String> headers = Map();
      headers["Content-Type"] = "application/json";
      final res = await http.post(baseUrl + "/user",
          body: jsonEncode(user), headers: headers);
      print(res.toString());
      if (res.statusCode != 200) throw new Exception(res.statusCode.toString());
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  Future<User> update(User user) async {
    Map<String, String> headers = Map();
    headers["Content-Type"] = "application/json";
    ApiModel<User> apiModel = ApiModel(
        url: baseUrl + "/user",
        body: user,
        headers: headers,
        parse: (response) {
          String data = Utf8Decoder().convert(response.bodyBytes);
          final jsonData = jsonDecode(data);
          return User.formJson(jsonData);
        });
    User res = await apiService.put(apiModel);
    if (res != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("user", jsonEncode(res));
    }
    return res;
  }
}
