/*
  Streambuilder is similar to setstate(), but setstate() rebuilds entire stateless widget when fired,
  while Streambuilder rebuild only widget inside the builder.  

  It is asynchoronus.
*/

import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamCounterPage(),
    );
  }
}

class StreamCounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StreamCounterPageState();
  }
}

class _StreamCounterPageState extends State<StreamCounterPage> {
  int _counter = 0;

  //initialize the StreamController, it is of integer type.
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void dispose() {
    //if not needed , close the StreamController, to free up resources and avoid mem. leaks
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed button this many time :'),

            //Wrap the widget that needs to be rebuild with StreamBuilder.

            StreamBuilder(
              stream: _streamController
                  .stream, //provide the stream, to which we listen
              initialData:
                  0, //initial data, if it is not used , You need to check with snapshot.hasData
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text(
                  '${snapshot.data}', //update the widget,when stream data is updated
                  style: Theme.of(context).textTheme.display1,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _streamController.sink.add(++_counter); //update the data,
        },
        tooltip: 'Increment the counter',
        child: Icon(Icons.add),
      ),
    );
  }
}