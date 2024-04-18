import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  //End of  Send the HTTP POST request
  Future<dynamic> post(
      {required String postUrl, @required dynamic body}) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    http.Response response = await http.post(Uri.parse(postUrl),
        body: jsonEncode(body), headers: headers);
    print("response.state code: " + response.statusCode.toString());

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print("response.body: " + response.body.toString());
      return data;
    } else {
      throw Exception(
          "There was an error with status code : ${response.statusCode}, and body : ${jsonDecode(response.body)}");
    }
  }
}
