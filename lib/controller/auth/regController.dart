import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class RegController {
  Future<bool> CreateAccoutFunction({required Map data}) async {
    try {
      Uri url = Uri.parse("https://b4.coderangon.com/api/register");

      var header = {"Accept": "application/json"};

      var response = await http.post(url, body: data, headers: header);

      log("==========${response.statusCode}====");

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("======Success====");
        return true;
      } else if (response.statusCode == 422) {
        log("=====number is already taken======");
        return false;
      }
    } catch (e) {
      log("=====Error : $e====");
    }
    return false;
  }
}
