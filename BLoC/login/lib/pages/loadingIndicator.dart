import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String msg;

  LoadingIndicator({@required this.msg});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(height: 8.0),
              Text(msg),
            ],
          ),
        ),
      );
}
