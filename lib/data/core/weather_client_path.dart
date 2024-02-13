import 'package:weatherapp/secrets/secrets.dart';

enum WeatherClientPath {
  current,
  forecast;

  const WeatherClientPath();

  String get path {
    switch (this) {
      case WeatherClientPath.current:
        return '/v1/current.json';
      case WeatherClientPath.forecast:
        return '/v1/forecast.json';
    }
  }

  Uri get baseUri => Uri.https(
        'api.weatherapi.com',
        '',
        <String, dynamic>{
          'key': Secrets.apiKey(),
          'aqi': 'no',
        },
      );

  Uri getUriCurrent([String? query]) {
    if (query == null) {
      return Uri.https(
        baseUri.authority,
        path,
        baseUri.queryParameters,
      );
    }
    return Uri.https(
      baseUri.authority,
      WeatherClientPath.current.path,
      <String, dynamic>{...baseUri.queryParameters, 'q': query},
    );
  }

  Uri getUriForecast(String? city) {
    return Uri.https(
      baseUri.authority,
      path,
      {
        'q': city,
        'days': '10',
      }..addAll(baseUri.queryParameters),
    );
  }
}
