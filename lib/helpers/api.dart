import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "There was an error with status code : ${response.statusCode}");
    }
  }

  Future<dynamic> post(
      {required String postUrl, @required dynamic body}) async {
    http.Response response = await http.post(Uri.parse(postUrl), body: body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "There was an error with status code : ${response.statusCode}, and body : ${jsonDecode(response.body)}");
    }
  }
}
