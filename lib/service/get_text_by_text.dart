import 'package:sign_language_gp_app/helpers/api.dart';
import 'package:sign_language_gp_app/models/speech2text_model.dart';

class Translate {
  Future<Speech2Text> translate({
    required String text,
    required String voice_record,
  }) async {
    Map<String, dynamic> data = await Api()
        .post(postUrl: 'http://10.0.2.2:8000/models/translate', body: {
      'text': text,
      'voice_record': voice_record,
    });
    return Speech2Text.fromJson(data);
  }
}
