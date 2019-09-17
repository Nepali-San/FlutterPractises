// * A class that provides us a periodic stream.

class Ticker {
  // * @func  tick is a stream that repeatedly emits events.
  // * @param ticks is the initial time in seconds.

  Stream<int> tick({int ticks}) {
    /*    
      return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
          .take(ticks);          
     ? this return code is described in brief below:     
     */

    // * specify the interval at which we emit events.
    Duration interval = Duration(seconds: 1);

    // * subtract x from ticks to decrement time every seconds.
    // * this function will return remaining time into stream i.e. for a countdown timer
    int transform(x) => ticks - x - 1;

    // * we create an stream which emit event at a period of 'interval'.
    // * by default this stream will emit numbers(1,2,...) which is transformed using function
    // * this stream will emit infinite events,
    Stream<int> tickingStream = Stream<int>.periodic(
      interval,
      (i) => transform(i),
    );

    // * we can limit the events emitted, by using 'take(count)' where count is the number of events
    tickingStream = tickingStream.take(ticks);

    return tickingStream;
  }
}
