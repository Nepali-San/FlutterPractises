import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/bloc.dart';
import 'package:weather_bloc/cityInput.dart';

import 'model/weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = WeatherBloc();

    return MaterialApp(
      title: 'Weather search',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProvider(
        builder: (context) => weatherBloc,
        child: WeatherPage(),
      ),
    );
  }
}

class WeatherPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: BlocBuilder(
          bloc: BlocProvider.of<WeatherBloc>(context),
          builder: (BuildContext context, WeatherState state) {
            if (state is WeatherInitial) {
              return buildInitialInput();
            } else if (state is WeatherLoading) {
              return buildLoading();
            } else if (state is WeatherLoaded) {
              return buildColumnWithData(state.weather);
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return CityInputField();
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${weather.temp.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }
}
