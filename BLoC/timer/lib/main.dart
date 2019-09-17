import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/timerBloc/timer.dart';
import 'package:timer/ticker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TimerBloc _timerBloc = TimerBloc(ticker: Ticker());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.redAccent),
      title: 'Flutter Timer',
      home: BlocProvider(
        builder: (context) => _timerBloc,
        child: Timer(),
      ),
    );
  }
}

class Timer extends StatelessWidget {
  static const TextStyle timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    final TimerBloc _timerBloc = BlocProvider.of<TimerBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Timer')),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 100.0),
              child: Center(
                child: BlocBuilder(
                  bloc: _timerBloc,
                  builder: (context, state) {
                    final String minutesStr = ((state.duration / 60) % 60)
                        .floor()
                        .toString()
                        .padLeft(2, '0');
                    final String secondsStr = (state.duration % 60)
                        .floor()
                        .toString()
                        .padLeft(2, '0');
                    return Text(
                      '$minutesStr:$secondsStr',
                      style: Timer.timerTextStyle,
                    );
                  },
                ),
              ),
            ),
            BlocBuilder(
              condition: (previousState, currentState) =>
                  currentState.runtimeType != previousState.runtimeType,
              bloc: _timerBloc,
              builder: (context, state) => Actions(),
            ),
          ],
        ),
      ),
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _mapStateToActionButtons(
        timerBloc: BlocProvider.of<TimerBloc>(context),
      ),
    );
  }

  List<Widget> _mapStateToActionButtons({
    TimerBloc timerBloc,
  }) {
    final TimerState state = timerBloc.currentState;
    if (state is Ready) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () => timerBloc.dispatch(Start(duration: state.duration)),
        ),
      ];
    }
    if (state is Running) {
      return [
        FloatingActionButton(
          child: Icon(Icons.pause),
          onPressed: () => timerBloc.dispatch(Pause()),
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.dispatch(Reset()),
        ),
      ];
    }
    if (state is Paused) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () => timerBloc.dispatch(Resume()),
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.dispatch(Reset()),
        ),
      ];
    }
    if (state is Finished) {
      return [
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.dispatch(Reset()),
        ),
      ];
    }
    return [];
  }
}
