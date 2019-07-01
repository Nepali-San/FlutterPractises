import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:weather_bloc/model/weather.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is Getweather) {
      yield WeatherLoading();
      final Weather weather = await _fetchWeatherFromFakeApi(event.cityName);
      yield WeatherLoaded(weather);
    }
  }

  Future<Weather> _fetchWeatherFromFakeApi(String cityName) {
    return Future.delayed(Duration(seconds: 1), () {
      return Weather(
        cityName: cityName,
        // Temperature between 20 and 35.99
        temp: 20 + Random().nextInt(15) + Random().nextDouble(),
      );
    });
  }
}
