import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_bloc/model/weather.dart';

@immutable
abstract class WeatherState extends Equatable {
  WeatherState([List props = const []]) : super(props);
}

class WeatherLoading extends WeatherState {}

class WeatherInitial extends WeatherState {}

// Only the WeatherLoaded event needs to contain data
class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded(this.weather) : super([weather]);
}
