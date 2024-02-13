import 'package:flutter/material.dart';
import 'package:weatherapp/data/forecast/models/forecastday.dart';

class DetailScreen extends StatelessWidget {
  final Forecastday forecastday;
  const DetailScreen({Key? key, required this.forecastday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: 600,
          width: 600,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: forecastday.hour.length,
            separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
            ),
            itemBuilder: (BuildContext context, int index) {
              var forecastDataHourTime = forecastday.hour[index].time;

              var forecastDataHour = forecastday.hour[index];
              var currentHour = DateTime.now().toString();

              DateTime firstDateTime = DateTime.parse(forecastDataHourTime);
              DateTime secondDateTime = DateTime.parse(currentHour);

              if (firstDateTime.isAfter(secondDateTime)) {
                return SizedBox(
                  width: 100,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(forecastDataHour.condition
                            .decode(forecastDataHour.condition.code)),
                        Text(forecastDataHour.time),
                        Text('${forecastDataHour.tempC}°C'),
                      ],
                    ),
                  ),
                );
              } else {
                // Jeśli godzina z prognozy jest mniejsza lub równa aktualnej godzinie, nie wyświetlaj niczego
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
