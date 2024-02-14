import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:weatherapp/screens/home_screen.dart';

main() async {
  // final forecast = await WeatherClient().getForecast("Warsaw");
  // var forecastDataHour = forecast.forecastday[1].hour[1].time;
  // var currentHour = DateTime.now();
  // print(forecastDataHour);
  // print(currentHour.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => ForecastBloc(),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          ),
        ));
  }
}
