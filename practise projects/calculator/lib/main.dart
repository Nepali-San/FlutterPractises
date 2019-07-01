import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String symbol = '', num1 = '', num2 = '', histroy = '';
  int noofsymbol = 0;
  bool erase = false;

  StreamController<String> _streamController = StreamController<String>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void calculate() {
    if (num1 == '' || num2 == '') return;
    histroy = num1 + symbol + num2;
    try {
      switch (symbol) {
        case '+':
          num1 =
              (double.parse(num1) + double.parse(num2)).toStringAsPrecision(6);
          break;
        case '-':
          num1 =
              (double.parse(num1) - double.parse(num2)).toStringAsPrecision(6);
          break;
        case 'x':
          num1 =
              (double.parse(num1) * double.parse(num2)).toStringAsPrecision(6);
          break;
        case '/':
          num1 =
              (double.parse(num1) / double.parse(num2)).toStringAsPrecision(6);
          break;
      }
      noofsymbol = 0;
      symbol = '';
      num2 = '';
      erase = true;
    } catch (error) {
      num1 = 'Error';
      num2 = '';
      erase = true;
      noofsymbol = 0;
      symbol = '';
    }
    _streamController.sink.add(num1 + symbol + num2);
  }

  void getNumber(String numb) {
    if (numb == 'C') {
      symbol = '';
      num1 = '';
      num2 = '';
      histroy = '';
      noofsymbol = 0;
      erase = false;
      _streamController.sink.add(num1 + symbol + num2);
      return;
    }

    if (numb == '+' || numb == '-' || numb == 'x' || numb == '/') {
      if (num1 == 'Error' || num1 == '') return;
      noofsymbol++;
      if (noofsymbol > 1) {
        calculate();
        noofsymbol = 1;
      }
      symbol = numb;
      _streamController.sink.add(num1 + symbol + num2);
      return;
    }

    if (erase && noofsymbol == 0) {
      num1 = '';
      erase = false;
    }

    if (noofsymbol == 0) {
      if (numb == '.' && num1.contains('.')) return;
      if (num1.length > 6) return;
      num1 += numb;
    } else {
      if (numb == '.' && num2.contains('.')) return;
      if (num2.length > 6) return;

      num2 += numb;
    }
    _streamController.sink.add(num1 + symbol + num2);
  }

  Widget _buildButton(String str) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(30.0),
        onPressed: () {
          if (str == '=')
            return calculate();
          else
            return getNumber(str);
        },
        child: Text(
          str,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Column(
          children: <Widget>[
            StreamBuilder<String>(
                stream: _streamController.stream,
                initialData: "Clicky Calculator",
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Text(
                          histroy,
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Text(
                          snapshot.data,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  );
                }),
            Expanded(
              child: Container(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('/'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('x'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('C'),
                    _buildButton('0'),
                    _buildButton('.'),
                    _buildButton('+'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('='),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
