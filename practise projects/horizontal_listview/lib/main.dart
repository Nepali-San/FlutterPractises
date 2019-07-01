//Horizontal listview.
//Lists that scrolls horizontally.
//we need to override scrollDirection of Standard listview, default is vertical direction

import 'package:flutter/material.dart';
import 'package:horizontal_listview/ListViewBuilder.dart';
import 'package:horizontal_listview/normalListView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Horizontal List'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Headline',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 200.0,
                child: NormalListview(),
              ),
              Text(
                'Demo Headline 2',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 570,
                child: ListviewBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
