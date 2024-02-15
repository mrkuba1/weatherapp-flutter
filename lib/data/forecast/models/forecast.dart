import 'package:weatherapp/data/forecast/models/current.dart';
import 'package:weatherapp/data/forecast/models/forecastday.dart';
import 'package:weatherapp/data/forecast/models/location.dart';

class Forecast {
  final List<Forecastday> forecastday;
  final Current current;
  final Location location;

  Forecast({
    required this.forecastday,
    required this.current,
    required this.location,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    final List<dynamic> forecastdayList = json['forecast']['forecastday'];
    final Current current = Current.fromJson(json['current']);
    final Location location = Location.fromJson(json['location']);
    return Forecast(
      current: current,
      location: location,
      forecastday: forecastdayList
          .map((forecastday) => Forecastday.fromJson(forecastday))
          .toList(),
    );
  }
  @override
  String toString() {
    return 'Forecast{ '
        'forecastday: $forecastday, location: $location, current: $current'
        '}';
  }
}
