class CounterState {
  //counter property to store the counter value;
  final int counter;

  //a immutable Constructor
  const CounterState({this.counter});

  //when app starts the counter is set to 0.
  factory CounterState.initial() => CounterState(counter: 0);
}
