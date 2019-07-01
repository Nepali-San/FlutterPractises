import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Container(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            Text("You are logged in !!!"),
            SizedBox(height: 25.0),
            OutlineButton(
              child: Text("Logout"),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((onValue) {
                  Navigator.pushReplacementNamed(context, '/loginPage');
                }).catchError((e) => print(e));
              },
            )
          ],
        ),
      ),
    );
  }
}
