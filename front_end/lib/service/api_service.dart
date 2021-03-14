import 'dart:convert';
import 'package:ecommerce/model/api_model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<T> load<T>(ApiModel<T> resource) async {
    final res = await http.get(resource.url, headers: resource.headers);
    if (res.statusCode == 200){
      return resource.parse(res);
    }
    else
      throw Exception(res.statusCode);
  }

  Future<T> post<T>(ApiModel<T> resource) async {
    final res = await http.post(resource.url, body: jsonEncode(resource.body), headers: resource.headers);
    if (res.statusCode == 200) {
      if (resource.parse != null)
        return resource.parse(res);
    }
    else
      throw Exception(res.statusCode);
  }

}