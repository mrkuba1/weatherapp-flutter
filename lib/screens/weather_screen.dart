import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp/screens/home_screen.dart';
import 'package:weatherapp/widgets/thermometr.dart';
import 'package:weatherapp/widgets/weather_future.dart';
import 'package:weatherapp/widgets/weather_info.dart';

class WeatherScreen extends StatelessWidget {
  final String cityName;

  const WeatherScreen({Key? key, required this.cityName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
            padding:
                const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Align(
                      alignment: const AlignmentDirectional(2, -0.1),
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                      )),
                  Align(
                      alignment: const AlignmentDirectional(-2, -0.1),
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                      )),
                  Align(
                      alignment: const AlignmentDirectional(3, -1.5),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                            color: DateTime.now().hour < 12
                                ? Colors.cyan
                                : Colors.purple,
                            shape: BoxShape.circle),
                      )),
                  Align(
                      alignment: const AlignmentDirectional(-3, -1.5),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                            color: DateTime.now().hour < 12
                                ? Colors.cyan
                                : Colors.purple,
                            shape: BoxShape.circle),
                      )),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                    child: Container(
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Moje miasto to $cityName',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300)),
                                const SizedBox(height: 8.0),
                                Text(
                                    DateTime.now().hour < 12
                                        ? 'Good Morning'
                                        : DateTime.now().hour < 18
                                            ? 'Good Afternoon'
                                            : 'Good Night',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(child: Icon(Icons.home)),
                              ),
                            ),
                          ],
                        ),
                        const Thermometer(
                          temperature: 20.0,
                        ),
                        const WeatherInfo(),
                        const WeatherFuture(),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
