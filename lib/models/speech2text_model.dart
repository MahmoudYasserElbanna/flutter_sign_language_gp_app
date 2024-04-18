class Speech2Text {
  final dynamic translation;
  final dynamic time_spent;
  Speech2Text({required this.time_spent, required this.translation});
  factory Speech2Text.fromJson(jsonData) {
    return Speech2Text(
      translation: jsonData['translation'],
      time_spent: jsonData['time_spent'],
    );
  }
}
