import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:weatherapp/bloc/weather_state.dart';
import 'package:weatherapp/screens/home_screen.dart';
import 'package:weatherapp/widgets/thermometr.dart';
import 'package:weatherapp/widgets/weather_future.dart';
import 'package:weatherapp/widgets/weather_info.dart';

class WeatherPage extends StatelessWidget {
  final String cityName;

  const WeatherPage({Key? key, required this.cityName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
            DateTime.now().hour < 12
                ? 'Good Morning'
                : DateTime.now().hour < 18
                    ? 'Good Afternoon'
                    : 'Good Night',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.black,
      body: BlocBuilder<ForecastBloc, ForecastBlocState>(
        builder: (context, state) {
          if (state is ForecastBlocLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ForecastBlocSuccess) {
            return
                // SingleChildScrollView(
                //     physics: AlwaysScrollableScrollPhysics(),
                //     child: RefreshIndicator(
                //         onRefresh: () async {
                //           final forecastBloc =
                //               BlocProvider.of<ForecastBloc>(context);
                //           forecastBloc.add(FetchForecast(cityName));
                //         },
                //         child:
                Padding(
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
                            color: Colors.green, shape: BoxShape.circle),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-2, -0.1),
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                      ),
                    ),
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
                      ),
                    ),
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
                      ),
                    ),
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
                                  Text('City 📍${state.forecast.location.name}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300)),
                                  const SizedBox(height: 8.0),
                                ],
                              ),
                            ],
                          ),
                          Thermometer(
                            forecast: state.forecast,
                          ),
                          WeatherInfo(forecast: state.forecast),
                          WeatherFuture(forecast: state.forecast),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Padding(
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
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-2, -0.1),
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                      ),
                    ),
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
                      ),
                    ),
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
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Failed to fetch weather data',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Exit',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
