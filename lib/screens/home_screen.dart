import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:weatherapp/bloc/weather_event.dart';
import 'package:weatherapp/pages/weather_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/home.png"),
            SizedBox(
              height: 100,
              width: 200,
              child: TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  hintText: 'Enter city',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                String cityName = cityController.text;
                if (cityName.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Empty City Name"),
                        content: const Text("Please enter a city name."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  final forecastBloc = BlocProvider.of<ForecastBloc>(context);
                  forecastBloc.add(FetchForecast(cityName));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherPage(cityName: cityName),
                    ),
                  );
                }
              },
              child: Container(
                height: 100,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    "Push the button",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
