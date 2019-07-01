import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  WeatherEvent([List props = const []]) : super(props);
}

class Getweather extends WeatherEvent {
  final String cityName;
  Getweather(this.cityName) : super([cityName]);
}
