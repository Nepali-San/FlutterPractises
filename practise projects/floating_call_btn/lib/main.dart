import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //we will have 3 floating buttons each with different functionality.
  //add url_launcher plugin first.
  //url_launcher is asynchorous so we use Future or .then()

  Future _smsAction(String number) async {
    final url = 'sms:$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Unable to send email";
    }
  }

  //using .then() style instead of future and async/await as above.
  void _callAction(String number) {
    final url = 'tel:$number';
    canLaunch(url).then(
      (bool launched) {
        if (launched) {
          launch(url);
        } else {
          throw "Unable to call";
        }
      },
    );
  }

  Future _emailAction(String email, String subject, String message) async {
    final url = 'mailto:$email?subject=$subject&body=$message';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Unable to send email";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Buttons',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Floating Buttons"),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.call),
              tooltip: 'Calls 981112233', //hint on long press
              foregroundColor: Colors.blue,
              backgroundColor: Colors.yellow,
              heroTag: '1',
              onPressed: () => _callAction('9811122233'),
            ),
            SizedBox(width: 8.0),
            FloatingActionButton(
              child: Icon(Icons.message),
              mini: true, //for mini-sized btn
              tooltip: 'sms to 981112233', //hint on long press
              heroTag:
                  '2', //if multiple floating btn, we need to give unique tag to each one
              foregroundColor: Colors.red,
              backgroundColor: Colors.white,
              onPressed: () => _smsAction('9811122233'),
            ),
            SizedBox(width: 8.0),
            FloatingActionButton(
              child: Icon(Icons.email),
              heroTag: '3',
              onPressed: () => _emailAction(
                    '123myemail@gmail.com',
                    "Buying a product",
                    "test message",
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
