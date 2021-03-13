
import 'package:ecommerce/constants.dart';
import 'package:http/http.dart' as http;

class UserService {

  final httpClient = http.Client();

  Future<bool> isEmailExisted({String email}) async {
    final res = await httpClient.post(baseUrl + "/user/check-email?email="+email);
    print("Res: $res");
    return false;
  }

}