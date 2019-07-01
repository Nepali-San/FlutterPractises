import 'package:counter_app_with_bloc/counter_bloc.dart';
import 'package:counter_app_with_bloc/counter_event.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterAppState();
  }
}

class _CounterAppState extends State<CounterApp> {
  final _bloc = CounterBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Container(
        child: Center(
          child: StreamBuilder(
            stream: _bloc.counter,
            initialData: 0,
            builder: (context, snapshot) {
              return Text(
                '${snapshot.data}',
                style: TextStyle(
                  fontSize: 50.0,
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: "Increase number by 1",
            backgroundColor: Colors.blue,
            onPressed: () {
              _bloc.counterEventSink.add(CounterEvent.IncrementEvent);
            },
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            child: Icon(Icons.remove),
            tooltip: "Decrease number by 1",
            backgroundColor: Colors.red,
            onPressed: () {
              _bloc.counterEventSink.add(CounterEvent.DecrementEvent);
            },
          )
        ],
      ),
    );
  }
}
