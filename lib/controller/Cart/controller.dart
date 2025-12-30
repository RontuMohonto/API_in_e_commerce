import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class CartGetController {
  Future<void> getdata() async {
    try {
      Uri url = Uri.parse("https://eplay.coderangon.com/api/cart");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data'];
      }
    } catch (e) {
      log("= Error : $e===");
    }
  }
}
