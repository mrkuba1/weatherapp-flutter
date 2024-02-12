import 'dart:convert';

import 'package:weatherapp/data/core/base_client.dart';
import 'package:weatherapp/data/core/weather_client_path.dart';
import 'package:weatherapp/data/current/models/current.dart';
import 'package:weatherapp/data/forecast/models/forecast.dart';

class WeatherClient extends WABaseClient {
  Future<Current> getCurrent(String location) async {
    final response =
        await get(WeatherClientPath.current.getUriCurrent(location));
    return Current.fromJson(response.body);
  }

  Future<Forecast> getForecast(String location) async {
    final response =
        await get(WeatherClientPath.forecast.getUriForecast(location));

    if (response.statusCode == 200) {
      return Forecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load forecast');
    }
  }
}
