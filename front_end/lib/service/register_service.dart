
import 'package:ecommerce/constants/api_constant.dart';
import 'package:http/http.dart' as http;

class RegisterService {

  String apiUrl = baseUrl + "/register";

  Future<String> sendOtp(
      {String email, String name}) async {
    try {
      final res = await http.post(apiUrl +"/otp?" +
          "email=" +
          email +
          "&name=" +
          name);
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
      final res = await http.post(apiUrl + "/check-email?email=" + email);
      if (res.body == "true") return true;
      return false;
    } catch (exception) {
      throw new Exception(exception.toString());
    }
  }

  Future<bool> isUsernameExisted({String username}) async {
    try {
      final res = await http
          .post(apiUrl + "/check-username?username=" + username);
      if (res.body == "true") return true;
      return false;
    } catch (exception) {
      throw new Exception(exception.toString());
    }
  }
}