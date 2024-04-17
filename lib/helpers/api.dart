import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    List<int> audioBytes = await File(url).readAsBytes();
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "There was an error with status code : ${response.statusCode}");
    }
  }

  // Send the HTTP POST request
  static Future<void> sendAudioToAPI(String audioPath) async {
    try {
      List<int> audioBytes = await File(audioPath).readAsBytes();

      // Create the request body
      Map<String, dynamic> requestBody = {
        'audio': audioBytes,
      };

      // Send the HTTP POST request
      http.Response response = await http.post(
        Uri.parse('http://10.0.2.2:8000/models/speech'),
        body: requestBody,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Audio sent to the API successfully');
      } else {
        print('Failed to send audio to the API');
      }
    } catch (e) {
      print('Error sending Audio to the Sign language API: $e');
    }
  }

  //End of  Send the HTTP POST request
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
