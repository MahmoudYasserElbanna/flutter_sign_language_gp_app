class Speech2Text {
  final String speech2text;
  Speech2Text({required this.speech2text});
  factory Speech2Text.fromJson(jsonData) {
    return Speech2Text(speech2text: jsonData['']);
  }
}
