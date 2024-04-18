import 'package:sign_language_gp_app/helpers/api.dart';
import 'package:sign_language_gp_app/models/speech2text_model.dart';

class Translate {
  final Api api;

  Translate(this.api);

  Future<Speech2Text> translate({
    required dynamic text,
    String voiceRecord = "",
  }) async {
    try {
      Map<String, dynamic> data = await api.post(
        postUrl: "http://10.0.2.2:8000/models/translate",
        body: {
          "text": text,
          "voice_record": voiceRecord,
        },
      );
      print('Data From translate class' + data.toString());
      return Speech2Text.fromJson(data);
    } catch (e) {
      print('Error in translation: $e');
      rethrow;
    }
  }
}
