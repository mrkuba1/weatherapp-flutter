import 'package:equatable/equatable.dart';
import 'package:weatherapp/data/forecast/models/forecast.dart';

sealed class ForecastBlocState extends Equatable {
  const ForecastBlocState();

  @override
  List<Object> get props => [];
}

final class ForecastBlocInitial extends ForecastBlocState {}

final class ForecastBlocLoading extends ForecastBlocState {}

final class ForecastBlocFailure extends ForecastBlocState {}

final class ForecastBlocSuccess extends ForecastBlocState {
  final Forecast forecast;

  const ForecastBlocSuccess(this.forecast);

  @override
  List<Object> get props => [forecast];
}
