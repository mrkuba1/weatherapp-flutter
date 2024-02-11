import 'package:weatherapp/data/forecast/models/weather_day.dart';

class ForecastWeatherModel {
  final String location;
  final List<WeatherDayModel> weatherDays;

  ForecastWeatherModel({
    required this.location,
    required this.weatherDays,
  });

  Map<String, dynamic> toMap(Map<String, dynamic> map) {
    return {
      'weatherDays': (map['forecast'] as List<dynamic>?)
              ?.map((x) => WeatherDayModel.fromMap(x))
              .whereType<WeatherDayModel>()
              .toList() ??
          [],
    };
  }

  @override
  String toString() {
    return 'ForecastWeatherModel(location: $location, weatherDays: $weatherDays)';
  }

  ForecastWeatherModel copyWith({
    String? location,
    List<WeatherDayModel>? weatherDays,
  }) {
    return ForecastWeatherModel(
      location: location ?? this.location,
      weatherDays: weatherDays ?? this.weatherDays,
    );
  }

  factory ForecastWeatherModel.fromMap(Map<String, dynamic> map) {
    return ForecastWeatherModel(
        weatherDays: (map['forecastday'] as List<dynamic>?)
                ?.map((x) => WeatherDayModel.fromMap(x))
                .whereType<WeatherDayModel>()
                .toList() ??
            [],
        location: map['location']['name']);
  }

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    String location = json['location']['name'];
    List<dynamic> weatherDaysData = json['forecastday'];
    List<WeatherDayModel> weatherDays =
        weatherDaysData.map((day) => WeatherDayModel.fromJson(day)).toList();

    return ForecastWeatherModel(
      location: location,
      weatherDays: weatherDays,
    );
  }
}
