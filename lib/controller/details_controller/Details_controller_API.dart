import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class GetProductDetails {
  Future<Map> getData() async {
    try {
      Uri url = Uri.parse("https://b4.coderangon.com/api/products");
      var response = await http.get(url);
      if(response.statusCode == 200){
        var jsonData = jsonDecode(response.body);
        log("=========${response.body}======");
        return jsonData['data'];
      }
    } catch (e) {
      log("=========${e}=====");
    }
    return {};
  }
}
