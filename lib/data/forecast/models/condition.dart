import 'dart:convert';
import 'dart:io';

class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }

  @override
  String toString() {
    return 'Condition{ '
        'text: $text, '
        'icon: $icon, '
        'code: $code '
        '}';
  }

  String decode(int code) {
    late List<Map<String, dynamic>> weatherData;
    String filePath =
        '/Users/kuba/Documents/Projekty/flutterApps/weatherapp-flutter/assets/weather_conditions.json';

    String data = File(filePath).readAsStringSync();
    weatherData = json.decode(data).cast<Map<String, dynamic>>();
    for (Map<String, dynamic> obj in weatherData) {
      if (obj['code'] == code) {
        return 'assets/${obj['icon']}.png';
      }
    }
    return '';
  }
}
