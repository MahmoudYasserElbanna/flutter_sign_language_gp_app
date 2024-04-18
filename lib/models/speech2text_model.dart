class Speech2Text {
  final String translation;
  final dynamic time_spent;
  final List<dynamic> ids;
  Speech2Text({
    required this.ids,
    required this.time_spent,
    required this.translation,
  });
  factory Speech2Text.fromJson(jsonData) {
    print('Json data from class speech2 text :' + jsonData.toString());
    return Speech2Text(
      ids: jsonData['ids'],
      translation: jsonData['translation'],
      time_spent: jsonData['time_spent'],
    );
  }
}
