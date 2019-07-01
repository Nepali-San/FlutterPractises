import 'package:counter_app_with_bloc_lib/counter_bloc.dart';
import 'package:counter_app_with_bloc_lib/counter_event.dart';
import 'package:counter_app_with_bloc_lib/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CntPage();
  }
}

class CntPage extends State<MyApp> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        bloc: _counterBloc,
        child: _CntPageState(),
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}

class _CntPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //due to BlocProvider used above we can inherit it here.
    final _counterbloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: BlocBuilder<CounterEvent, CounterState>(
          bloc: _counterbloc,
          builder: (context, CounterState state) {
            return Center(
              child: Text(
                '${state.counter}',
                style: Theme.of(context).textTheme.display1,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _counterbloc.dispatch(IncrementEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 8.0),
          FloatingActionButton(
            onPressed: () => _counterbloc.dispatch(DecrementEvent()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
