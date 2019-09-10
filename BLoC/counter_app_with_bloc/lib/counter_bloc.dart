import 'dart:async';

import 'package:counter_app_with_bloc/counter_event.dart';

class CounterBloc {

  // * normally we store state variables in a seprate file counter_state.dart
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  Sink<int> get _incounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event == CounterEvent.IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _incounter.add(_counter);
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}
