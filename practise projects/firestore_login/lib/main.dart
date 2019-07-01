import 'package:firestore_login/homePage.dart';
import 'package:firestore_login/loginPage.dart';
import 'package:firestore_login/signupPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/landingPage': (BuildContext context) => MyApp(),
        '/signupPage': (BuildContext context) => SignUpPage(),
        '/loginPage': (BuildContext context) => LoginPage(),
        '/homePage': (BuildContext context) => HomePage(),
      },
    );
  }
}
