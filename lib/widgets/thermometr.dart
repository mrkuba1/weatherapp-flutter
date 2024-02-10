import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/gradient_extension.dart';

class Thermometer extends StatelessWidget {
  final double temperature;

  const Thermometer({
    super.key,
    required this.temperature,
  });

  static const double _minTemperature = -20.0;

  static const double _maxTemperature = 50.0;

  static const LinearGradient _colorGradient = LinearGradient(
    stops: [
      0.1,
      0.2,
      0.4,
      0.6,
      0.9,
    ],
    colors: [
      Colors.red,
      Colors.orange,
      Colors.amber,
      Colors.green,
      Colors.lightBlue,
      Colors.blueGrey,
    ],
  );

  Color _getColor(double temperature) {
    const minValue = _minTemperature;
    const maxValue = _maxTemperature;
    const range = maxValue - minValue;

    return _colorGradient.colorAt(
      (maxValue - temperature) / range,
    )!;
  }

  double _getHeightFactor(double temperature) {
    const minValue = _minTemperature;
    const maxValue = _maxTemperature;
    const range = maxValue - minValue;

    return 1 - (maxValue - temperature) / range;
  }

  @override
  Widget build(BuildContext context) {
    final heightFactor = _getHeightFactor(temperature);
    final color = _getColor(temperature);

    return Center(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 300,
            child: AnimatedContainer(
                clipBehavior: Clip.none,
                height: (heightFactor * 400).clamp(50, 300),
                alignment: Alignment.topCenter,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/1.png",
                      scale: 3,
                    ),
                    TemperatureLabel(
                      temperature: temperature,
                    ),
                  ],
                )),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AnimatedContainer(
                  width: 50,
                  height: heightFactor * 150,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: const ShapeDecoration(
                    color: Colors.transparent,
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 4,
                      ),
                    ),
                  ),
                  width: 50,
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TemperatureLabel extends StatelessWidget {
  final double temperature;

  const TemperatureLabel({
    super.key,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Text(temperature.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          const SizedBox(width: 4),
          const Text('°C',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
