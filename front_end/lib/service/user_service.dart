import 'dart:convert';

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/model/api_model.dart';
import 'package:ecommerce/model/authentication_request.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/service/api_service.dart';
import 'package:http/http.dart' as http;

class UserService {
  ApiService apiService = ApiService();

  Future<String> sendOtp({String email, String firstName, String lastName}) async {
    try {
      final res = await http.post(baseUrl + "/user/otp?"
      + "email=" + email
      + "&firstName=" + firstName
      + "&lastName=" + lastName);
      if (res.statusCode == 200){
        return res.body;
      }
      else
        throw new Exception(res.statusCode.toString());
    }
    catch (exception) {
      throw new Exception(exception.toString());
    }
  }
  
  Future<bool> isEmailExisted({String email}) async {
    try {
      final res = await http.post(baseUrl + "/user/check-email?email=" + email);
      if (res.body == "true")
        return true;
      return false;
    } catch (exception) {
      throw new Exception(exception.toString());
    }
  }

  Future<bool> isUsernameExisted({String username}) async {
    try {
      final res = await http
          .post(baseUrl + "/user/check-username?username=" + username);
      if (res.body == "true")
        return true;
      return false;
    } catch (exception) {
      throw new Exception(exception.toString());
    }
  }

  Future<String> authenticate(String username, String password) async {
    Map<String, String> headers = Map();
    headers["Content-Type"] = "application/json;charset=UTF-8";
    try {
      final res = await http.post(baseUrl + "/user/authenticate",
          body: jsonEncode(
              AuthenticationRequest(username: username, password: password)),
          headers: headers);
      String token = res.body;
      return token;
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  Future<User> getUserInfor(String token) async {
    Map<String, String> headers = Map();
    headers["Content-Type"] = "application/json";
    headers['Authorization'] = token;
    ApiModel<User> apiModel = ApiModel(
        url: baseUrl + "/user",
        headers: headers,
        parse: (response) {
          final jsonData = jsonDecode(response.body);
          return User.formJson(jsonData);
        });
    return apiService.load(apiModel);
  }
}
