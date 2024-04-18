import 'package:sign_language_gp_app/helpers/api.dart';
import 'package:sign_language_gp_app/models/speech2text_model.dart';

// TODO This Class Need to Update
class Speech {
  final Api api;
  Speech(this.api);
  Future<Speech2Text> speechToText({
    required String text,
    required String voice_record,
  }) async {
    Map<String, dynamic> data =
        await api.post(postUrl: 'http://10.0.2.2:8000/models/speech', body: {
      "text": text,
      "voice_record": voice_record,
    });
    return Speech2Text.fromJson(data);
  }
}
