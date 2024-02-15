import 'package:flutter/material.dart';

class TemperatureLabel extends StatelessWidget {
  final double temperature;

  const TemperatureLabel({
    super.key,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          Text(
            '${temperature.round().toString()} °C',
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
