import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weatherapp/data/forecast/models/forecastday.dart';
import 'package:weatherapp/data/forecast/models/hour.dart';

class DetailPage extends StatefulWidget {
  final Forecastday forecastday;
  const DetailPage({Key? key, required this.forecastday}) : super(key: key);

  @override
  DetailPageState createState() => DetailPageState();
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
}

class DetailPageState extends State<DetailPage> {
  List<bool> expandedList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.actualFutureHours().length; i++) {
      expandedList.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Weather info for ${widget.forecastday.date}",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 19),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
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
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-2, -0.1),
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(3, -1.5),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color:
                        DateTime.now().hour < 12 ? Colors.cyan : Colors.purple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -1.5),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color:
                        DateTime.now().hour < 12 ? Colors.cyan : Colors.purple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Hourly weather forecast',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.actualFutureHours().length,
                      itemBuilder: (BuildContext context, int index) {
                        var forecastDataHour =
                            widget.actualFutureHours()[index];

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              expandedList[index] = !expandedList[index];
                            });
                          },
                          child: SizedBox(
                            height: expandedList[index] ? 150 : 90,
                            child: Container(
                              height: 100,
                              margin: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            forecastDataHour.condition.decode(
                                              forecastDataHour.condition.code,
                                            ),
                                            width: 50,
                                            height: 50,
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 10),
                                              Text(
                                                'Hour: ${forecastDataHour.time.substring(11, 16)}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Temperature: ${forecastDataHour.tempC.round()}°C',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      expandedList[index]
                                          ? const Icon(Icons.keyboard_arrow_up,
                                              color: Colors.white)
                                          : const Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.white),
                                    ],
                                  ),
                                  if (expandedList[index])
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 60.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Humidity: ${forecastDataHour.humidity.toString()} %',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Wind: ${forecastDataHour.windKph.toString()} km/h', // Przykładowe dodatkowe informacje
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Condition: ${forecastDataHour.condition.text}', // Przykładowe dodatkowe informacje
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
