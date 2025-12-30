import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AddToCartController {
  Future<void> addtocart() async {
    try {
      FlutterSecureStorage _storage = FlutterSecureStorage();
      var t = await _storage.read(key: "token");
      Uri url = Uri.parse("https://eplay.coderangon.com/api/cart");
      var header = {
        "Accept": "application/json",
        "Content-type": "appliction/json",
        "Authorization": "Bearer $t",
      };
      var response = await http.post(url, headers: header);
    } catch (e) {
      log("Error : $e");
    }
  }
}
