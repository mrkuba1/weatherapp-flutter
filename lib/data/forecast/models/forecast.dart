import 'package:weatherapp/data/forecast/models/forecastday.dart';

class Forecast {
  final List<Forecastday> forecastday;

  Forecast({
    required this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    final List<dynamic> forecastdayList = json['forecast']['forecastday'];
    return Forecast(
      forecastday: forecastdayList
          .map((forecastday) => Forecastday.fromJson(forecastday))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'Forecast{ '
        'forecastday: $forecastday '
        '}';
  }
}
