import 'package:flutter/material.dart';
import 'package:weatherapp/data/forecast/models/forecast.dart';
import 'package:weatherapp/data/forecast/models/forecastday.dart';
import 'package:weatherapp/data/forecast/models/hour.dart';
import 'package:weatherapp/widgets/weather_info_dialog.dart';

class WeatherFuturePerHour extends StatefulWidget {
  final Forecastday forecastday;
  final Forecast forecast;
  const WeatherFuturePerHour(
      {super.key, required this.forecastday, required this.forecast});

  @override
  WeatherFuturePerHourState createState() => WeatherFuturePerHourState();

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

  String convertTime(String dateTimeString) {
    return dateTimeString.substring(11, 16);
  }
}

class WeatherFuturePerHourState extends State<WeatherFuturePerHour> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white),
            ),
            Text(
              'Next Hours',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width - 100,
                child: Center(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.actualFutureHours().length,
                      separatorBuilder: (context, index) => const Divider(
                            color: Colors.grey,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        // var forecastData = widget.forecastday.hour[index];
                        var forecastDataHour =
                            widget.actualFutureHours()[index];
                        if (widget.actualFutureHours().length == 0) {
                          return Container();
                        } else {
                          return SizedBox(
                            width: 130,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return WeatherInfoDialog(
                                        weatherHour: forecastDataHour);
                                  },
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(forecastDataHour.condition
                                        .decode(
                                            forecastDataHour.condition.code)),
                                    Text(
                                      widget.convertTime(forecastDataHour.time),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      '${forecastDataHour.tempC.round().toString()}°C',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                ),
              ),
            ]),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Center(
            child: Text(
          'Last update ${widget.forecast.current.lastUpdated}',
          style: const TextStyle(color: Colors.white),
        )),
      ],
    );
  }
}
