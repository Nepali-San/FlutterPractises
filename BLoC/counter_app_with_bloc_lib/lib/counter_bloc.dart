import 'package:bloc/bloc.dart';
import 'package:counter_app_with_bloc_lib/counter_event.dart';
import 'package:counter_app_with_bloc_lib/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(counter: currentState.counter + 1);
    } else {
      yield CounterState(counter: currentState.counter - 1);
    }
  }
}
