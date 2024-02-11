import 'package:flutter/material.dart';
import 'package:weatherapp/data/core/weather_client.dart';
import 'package:weatherapp/screens/home_screen.dart';

Future<void> main() async {
  // runApp(const MyApp());
  final forecast = await WeatherClient().getCurrent("Warszawa");
  print(forecast);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
