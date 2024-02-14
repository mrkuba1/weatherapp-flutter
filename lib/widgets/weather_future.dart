import 'package:flutter/material.dart';
import 'package:weatherapp/data/forecast/models/forecast.dart';
import 'package:weatherapp/screens/detail_page.dart';

class WeatherFuture extends StatelessWidget {
  final Forecast forecast;

  const WeatherFuture({Key? key, required this.forecast}) : super(key: key);

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
              'Next 2 Days',
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
                height: 130,
                width: 260,
                child: Center(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: forecast.forecastday.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var forecastData = forecast.forecastday[index];
                      if (index == 0) {
                        return Container();
                      }
                      return SizedBox(
                        width: 130,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(forecastday: forecastData)),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(forecastData.day.condition
                                    .decode(forecastData.day.condition.code)),
                                Text(
                                  forecastData.date,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                                Text(
                                  '${forecastData.day.avgtempC.round()}°C',
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
                    },
                  ),
                ),
              ),
            ]),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 40,
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(forecastday: forecast.forecastday[0]),
                  ),
                );
              },
              child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'More details',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ])),
        ),
        const SizedBox(height: 90),
        Center(
            child: Text(
          'Last update ${forecast.current.lastUpdated}',
          style: const TextStyle(color: Colors.grey),
        )),
      ],
    );
  }
}
