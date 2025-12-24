import 'dart:developer';
import 'package:http/http.dart' as http;

class LoginController {
  Future<void> login({required String phone, required String password}) async {
    try {
      var body = {"phone": phone.toString(), "password": password};

      var headers = {"Accept": "application/json"};

      Uri url = Uri.parse("https://b4.coderangon.com/api/login");

      var response = await http.post(url, body: body, headers: headers);

      log("status code : ${response.statusCode}");
      log("response: ${response.body}");
    } catch (e) {
      log("====== Error : $e ======");
    }
  }
}
