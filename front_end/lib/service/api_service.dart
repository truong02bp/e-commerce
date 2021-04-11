import 'dart:convert';
import 'package:ecommerce/model/api_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  
  Future<dynamic> load<T>(ApiModel<T> resource) async {
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
}
