import 'package:flutter/material.dart';
import 'package:weatherapp/data/forecast/models/hour.dart';

class WeatherInfoDialog extends StatelessWidget {
  final Hour weatherHour;

  const WeatherInfoDialog({super.key, required this.weatherHour});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Weather Information',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Temperature: ${weatherHour.tempC.round()} °C',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Cloundess: ${weatherHour.cloud} %',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Rain: ${weatherHour.chanceOfRain} %',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Snow: ${weatherHour.chanceOfSnow} %',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Humidity: ${weatherHour.humidity} %',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Pressure: ${weatherHour.pressureMb.round()} hPa',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(
                context); // Zamknięcie dialogu po naciśnięciu przycisku
          },
          child: const Center(child: Text('Close')),
        ),
      ],
    );
  }
}
