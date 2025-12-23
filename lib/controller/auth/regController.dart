import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class RegController {
  Future<void> CreateAccoutFunction() async {
    try {
      Uri url = Uri.parse("https://b4.coderangon.com/api/register");

      var body = {
        "name": "rontu",
        "phone": "01871232831",
        "password": "Rontu123@",
      };
      var header = {"Accept": "application/json"};

      var response = await http.post(url, body: body, headers: header);

      log("==========${response.statusCode}====");

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("======Success====");
      } else if (response.statusCode == 422) {
        log("=====number is already taken======");
      }
    } catch (e) {
      log("=====Error : $e====");
    }
  }
}
