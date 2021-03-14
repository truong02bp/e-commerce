
import 'package:http/http.dart' as http;

class ApiModel<T> {
  final String url;
  final dynamic body;
  final T Function(http.Response response) parse;
  final Map<String,String> headers;

  ApiModel({this.url, this.body, this.parse, this.headers});
}