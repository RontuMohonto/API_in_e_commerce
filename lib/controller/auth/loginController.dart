import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginController {
  static Future<void> login({
    required String phone,
    required String password,
  }) async {
    try {
      var body = {"phone": phone.toString(), "password": password};

      var headers = {"Accept": "application/json"};

      Uri url = Uri.parse("https://b4.coderangon.com/api/login");
      late FlutterSecureStorage _storage = FlutterSecureStorage();

      var response = await http.post(url, body: body, headers: headers);
      var data = jsonDecode(response.body)['token'];
      _storage.write(key: "token", value: data);

      if (response.statusCode == 200) {
        // log("status code : ${response.statusCode}");
        // log("response: ${response.body}");
        log("===Token======${jsonDecode(response.body)['token']}=====");
      }
    } catch (e) {
      log("====== Error : $e ======");
    }
  }
}
