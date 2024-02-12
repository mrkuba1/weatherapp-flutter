import 'package:equatable/equatable.dart';

abstract class ForecastBlocEvent extends Equatable {
  const ForecastBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchForecast extends ForecastBlocEvent {
  final String location;

  const FetchForecast(this.location);

  @override
  List<Object> get props => [location];
}
