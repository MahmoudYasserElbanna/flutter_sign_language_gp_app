import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Convert into product model.
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "There was an error with status code : ${response.statusCode}");
    }
  }
}
