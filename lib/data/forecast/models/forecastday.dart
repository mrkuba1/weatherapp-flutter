import 'package:weatherapp/data/forecast/models/astro.dart';
import 'package:weatherapp/data/forecast/models/day.dart';
import 'package:weatherapp/data/forecast/models/hour.dart';

class Forecastday {
  final String date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    final List<dynamic> hourList = json['hour'];
    return Forecastday(
      date: json['date'],
      dateEpoch: json['date_epoch'],
      day: Day.fromJson(json['day']),
      astro: Astro.fromJson(json['astro']),
      hour: hourList.map((hour) => Hour.fromJson(hour)).toList(),
    );
  }

  @override
  String toString() {
    return 'Forecastday{ '
        'date: $date, '
        'dateEpoch: $dateEpoch, '
        'day: $day, '
        'astro: $astro, '
        'hour: $hour '
        '}';
  }
}
