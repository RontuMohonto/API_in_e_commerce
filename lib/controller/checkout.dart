import 'dart:developer';

import 'package:http/http.dart' as http;

class CheckOutController {
  Future<bool> sentData() async {
    try {
      Uri url = Uri.parse("https://eplay.coderangon.com/api/order");
    } catch (e) {
      log("===Error : $e======");
    }
    return false;
  }
}
