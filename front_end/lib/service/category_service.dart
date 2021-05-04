import 'dart:convert';

import 'package:ecommerce/constants/api_constant.dart';
import 'package:ecommerce/model/api_model.dart';
import 'package:ecommerce/model/category.dart';
import 'package:ecommerce/service/api_service.dart';

class CategoryService {

  static CategoryService categoryService;

  static CategoryService getInstance(){
    if (categoryService == null)
      categoryService = CategoryService();
    return categoryService;  
  }

  ApiService apiService = ApiService.getInstance();

  final String apiUrl = baseUrl + "/category";

  Future<List<Category>> getAll({int size, int currentPage}) async {
    Map<String,String> headers = Map();
    ApiModel apiModel = ApiModel(
        url: apiUrl + "?size=$size&page=$currentPage",
        headers: headers,
        parse: (response) {
          String data = Utf8Decoder().convert(response.bodyBytes);
          final jsonData = jsonDecode(data);
          return jsonData.map<Category>((json) => Category.fromJson(json)).toList();
        });
    final res = await apiService.load(apiModel);
    return res;
  }
  
}
