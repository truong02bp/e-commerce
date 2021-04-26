import 'dart:convert';
import 'package:ecommerce/model/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ApiService {
  
  Future<dynamic> load<T>(ApiModel<T> resource) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    if (token != null)
      resource.headers['Authorization'] = token;
    try {
      final res = await http.get(resource.url, headers: resource.headers);
      if (res.statusCode == 200) {
        if (resource.parse != null) return resource.parse(res);
        return res.body;
      }
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  Future<dynamic> post<T>(ApiModel<T> resource) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    if (token != null)
      resource.headers['Authorization'] = token;
    try {
      final res = await http.post(resource.url,
          body: jsonEncode(resource.body), headers: resource.headers);
      if (res.statusCode == 200) {
        if (resource.parse != null) return resource.parse(res);
        return res.body;
      }
      return null;
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  Future<dynamic> put<T>(ApiModel<T> resource) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    if (token != null)
      resource.headers['Authorization'] = token;
    try {
      final res = await http.put(resource.url,
          body: jsonEncode(resource.body), headers: resource.headers);
      if (res.statusCode == 200) {
        if (resource.parse != null) return resource.parse(res);
        return res.body;
      }
      return null;
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }
}
