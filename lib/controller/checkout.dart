import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class CheckOutService {
  Future<bool> sentData({required Map data}) async {
    try {
      Uri url = Uri.parse("https://eplay.coderangon.com/api/order");
      var body = jsonEncode(data);
      var header = {
        "Accept": "application/json",
        "content-type": "application/json",
      };
      var response = await http.post(url, body: body, headers: header);
      log("=====${response.statusCode}==========");
    } catch (e) {
      log("===Error : $e======");
    }
    return false;
  }
}
