import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilderDemo(),
      theme: ThemeData(canvasColor: Colors.white70),
    );
  }
}

class StreamBuilderDemo extends StatefulWidget {
  @override
  _StreamBuilderDemoState createState() => _StreamBuilderDemoState();
}

class _StreamBuilderDemoState extends State<StreamBuilderDemo> {
  int _timer = 0;
  bool _paused = true;

  //UI and data updates every 1 sec, i is iteration value , increments after every 1 sec.
  final Stream<int> _periodicStream =
      Stream.periodic(Duration(milliseconds: 1000), (i) => i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: StreamBuilder(
        //listen to changes in _periodicStream.
        stream: _periodicStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('latest snapshot from stream : ${snapshot.data}');
            //only increment timer when , not paused.
            if (!_paused) {
              _timer++;
            }
          }
          return _buildUI();
        },
      ),
    );
  }

  Widget _buildUI() {
    return Center(
      child: Card(
        elevation: 5.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "$_timer",
              style: TextStyle(fontSize: 25),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(_paused ? Icons.play_arrow : Icons.pause),
                  onPressed: () {
                    _paused = !_paused;
                  },
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.restore),
                  onPressed: () {
                    _timer = 0;
                    _paused = true;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
