// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp/data/forecast/models/forecastday.dart';
import 'package:weatherapp/data/forecast/models/hour.dart';

class DetailScreen extends StatelessWidget {
  final Forecastday forecastday;
  const DetailScreen({Key? key, required this.forecastday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Hour> actualFutureHours() {
      var currentHour = DateTime.now().toString();
      List<Hour> listHour = [];

      for (int i = 0; i < forecastday.hour.length; i++) {
        var forecastDataHourTime = forecastday.hour[i].time;
        var forecastDataHour = forecastday.hour[i];
        DateTime firstDateTime = DateTime.parse(forecastDataHourTime);
        DateTime secondDateTime = DateTime.parse(currentHour);
        if (firstDateTime.isAfter(secondDateTime)) {
          listHour.add(forecastDataHour);
        }
      }
      return listHour;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Weather info for ${forecastday.date}",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 19),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(children: [
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
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),
                Column(children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hourly weather forecast',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: actualFutureHours().length,
                      itemBuilder: (BuildContext context, int index) {
                        var forecastDataHour = actualFutureHours()[index];

                        return SizedBox(
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      forecastDataHour.condition.decode(
                                          forecastDataHour.condition.code),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Hour: ${forecastDataHour.time.substring(11, 16)}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Temperature: ${forecastDataHour.tempC.round()}°C',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Humidity: ${forecastDataHour.humidity.toString()} %',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              ]))),
    );
  }
}
