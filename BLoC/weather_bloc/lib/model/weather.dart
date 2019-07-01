import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weather extends Equatable {
  final double temp;
  final String cityName;
  Weather({
    @required this.temp,
    @required this.cityName,
  }) : super([temp, cityName]);
}
