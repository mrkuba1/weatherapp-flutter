import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather_event.dart';
import 'package:weatherapp/bloc/weather_state.dart';
import 'package:weatherapp/data/core/weather_client.dart';
import 'package:weatherapp/data/forecast/models/forecast.dart';

class ForecastBloc extends Bloc<ForecastBlocEvent, ForecastBlocState> {
  ForecastBloc() : super(ForecastBlocInitial()) {
    on<FetchForecast>((event, emit) async {
      emit(ForecastBlocLoading());
      try {
        WeatherClient weatherClient = WeatherClient();

        Forecast forecast = await weatherClient.getForecast(event.location);
        emit(ForecastBlocSuccess(forecast));
      } catch (e) {
        emit(ForecastBlocFailure());
      }
    });
  }
}
