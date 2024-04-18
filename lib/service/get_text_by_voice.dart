import 'dart:convert';
import 'dart:io';
import 'package:sign_language_gp_app/helpers/api.dart';
import 'package:sign_language_gp_app/models/speech2text_model.dart';

class Speech {
  final Api api;
  Speech(this.api);
  Future<Speech2Text> speechToText({
    String text = "",
    required String voice_record,
  }) async {
    List<int> audioInBytes = await File(voice_record).readAsBytes();
    String base64Audio = base64Encode(audioInBytes);

    try {
      Map<String, dynamic> data =
          await api.post(postUrl: 'http://10.0.2.2:8000/models/speech', body: {
        "text": text,
        "voice_record": base64Audio,
      });

      return Speech2Text.fromJson(data);
    } on Exception catch (e) {
      print('Error in translation: $e');
      rethrow;
    }
  }
}
