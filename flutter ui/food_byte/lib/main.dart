import 'package:flutter/material.dart';
import 'package:food_byte/screens/MainScreen.dart';
import 'package:food_byte/util/const.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      //user 'Constants.darkTheme' for dark mode
      theme: Constants.darkTheme,
      home: MainScreen(),
    );
  }
}
