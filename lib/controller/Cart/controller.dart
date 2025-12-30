import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class CartGetController {
  Future<List> getdata() async {
    try {
      log("==0000000=");
      Uri url = Uri.parse("https://eplay.coderangon.com/api/cart");
      log("==1111111=");
      var header = {
        "Accept": "application/json",
        "content-type": "appliction/json",
      };
      var response = await http.get(url, headers: header);

      log("===${response.statusCode}  ${response.body}======");
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data'];
      }
    } catch (e) {
      log("= Error : $e===");
    }
    return [];
  }
}
