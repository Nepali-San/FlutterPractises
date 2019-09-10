// abstract class CounterEvent {}

// class IncrementEvent extends CounterEvent {}

// class DecrementEvent extends CounterEvent {}

enum CounterEvent {
  IncrementEvent,
  DecrementEvent,
}


// * normally bloc pattern uses abstract classes but for simple events we may use 
// * enums
