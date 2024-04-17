class Speech2Text {
  final String text;
  final String voice_record;
  Speech2Text({required this.voice_record, required this.text});
  factory Speech2Text.fromJson(jsonData) {
    return Speech2Text(
      text: jsonData['text'],
      voice_record: jsonData['voice_record'],
    );
  }
}
