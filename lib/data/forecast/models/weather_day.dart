import 'dart:convert';

class WeatherDayModel {
  final String date;
  final double maxTempC;
  final double minTempC;
  final double maxTempF;
  final double minTempF;
  final double tempC;
  final double tempF;
  final double windMph;
  final double windKph;
  final double humidity;
  final String sunrise;
  final String sunset;
  final String weatherCode;
  final String weatherDescription;
  final double chanceOfRain;
  final double chanceOfSnow;

  WeatherDayModel({
    required this.date,
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.minTempF,
    required this.tempC,
    required this.tempF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.weatherCode,
    required this.weatherDescription,
    required this.chanceOfRain,
    required this.chanceOfSnow,
  });
  WeatherDayModel copyWith({
    String? date,
    double? maxTempC,
    double? minTempC,
    double? maxTempF,
    double? minTempF,
    double? tempC,
    double? tempF,
    double? windMph,
    double? windKph,
    double? humidity,
    String? sunrise,
    String? sunset,
    String? weatherCode,
    String? weatherDescription,
    double? chanceOfRain,
    double? chanceOfSnow,
  }) {
    return WeatherDayModel(
      date: date ?? this.date,
      maxTempC: maxTempC ?? this.maxTempC,
      minTempC: minTempC ?? this.minTempC,
      maxTempF: maxTempF ?? this.maxTempF,
      minTempF: minTempF ?? this.minTempF,
      tempC: tempC ?? this.tempC,
      tempF: tempF ?? this.tempF,
      windKph: windKph ?? this.windKph,
      windMph: windMph ?? this.windMph,
      humidity: humidity ?? this.humidity,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      weatherCode: weatherCode ?? this.weatherCode,
      weatherDescription: weatherDescription ?? this.weatherDescription,
      chanceOfRain: chanceOfRain ?? this.chanceOfRain,
      chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
    );
  }

  factory WeatherDayModel.fromMap(Map<String, dynamic> json) {
    return WeatherDayModel(
      date: json['date'].toString(),
      maxTempC: json['day']['maxtemp_c']?.toDouble() ?? 0.0,
      maxTempF: json['day']['maxtemp_f']?.toDouble() ?? 0.0,
      minTempC: json['day']['mintemp_c']?.toDouble() ?? 0.0,
      minTempF: json['day']['mintemp_f']?.toDouble() ?? 0.0,
      tempC: json['day']['avgtemp_c']?.toDouble() ?? 0.0,
      tempF: json['day']['avgtemp_f']?.toDouble() ?? 0.0,
      windKph: json['day']['maxwind_kph']?.toDouble() ?? 0.0,
      windMph: json['day']['maxwind_mph']?.toDouble() ?? 0.0,
      humidity: json['day']['avghumidity']?.toDouble() ?? 0.0,
      sunrise: json['astro']['sunrise']?.toString() ?? '',
      sunset: json['astro']['sunset']?.toString() ?? '',
      weatherCode: json['day']['condition']['code']?.toString() ?? '',
      weatherDescription: json['day']['condition']['text']?.toString() ?? '',
      chanceOfRain: json['day']['daily_chance_of_rain']?.toDouble() ?? 0.0,
      chanceOfSnow: json['day']['daily_chance_of_snow']?.toDouble() ?? 0.0,
    );
  }
  @override
  String toString() {
    return 'WeatherDayModel(date: $date, maxTempC: $maxTempC, minTempC: $minTempC, maxTempF: $maxTempF, minTempF: $minTempF, tempC: $tempC, tempF: $tempF, windKph: $windKph, windMph: $windMph, humidity: $humidity, sunrise: $sunrise, sunset: $sunset, weatherCode: $weatherCode, weatherDescription: $weatherDescription, chanceOfRain: $chanceOfRain, chanceOfSnow: $chanceOfSnow)';
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'maxtemp_c': maxTempC,
      'maxtemp_f': maxTempF,
      'mintemp_c': minTempC,
      'mintemp_f': minTempF,
      'avgtemp_c': tempC,
      'avgtemp_f': tempF,
      'maxwind_kph': windKph,
      'maxwind_mph': windMph,
      'avghumidity': humidity,
      'sunrise': sunrise,
      'sunset': sunset,
      'condition_code': weatherCode,
      'condition_text': weatherDescription,
      'daily_chance_of_rain': chanceOfRain,
      'daily_chance_of_snow': chanceOfSnow,
    };
  }

  factory WeatherDayModel.fromJson(String source) =>
      WeatherDayModel.fromMap(json.decode(source));
}
