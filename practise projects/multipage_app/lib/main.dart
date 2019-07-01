import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final ThemeData themeData = ThemeData(
  canvasColor: Colors.lightGreenAccent,
  accentColor: Colors.redAccent,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: HomePage(),

      //we push/pop the scaffolds inside the MaterialApp;

      //mapping route names to their builders.
      //homepage is by default mapped to '/'.
      routes: <String, WidgetBuilder>{
        '/pagetwo': (BuildContext context) => PageTwo(),
        '/pagethree': (BuildContext context) => PageThree(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("go to next page"),
          onPressed: () {
            Navigator.pushNamed(context, '/pagetwo');
          },
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page two"),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 1.0,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('go to page 3'),
          onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return PageThree();
              })),

          //without using the route name.
        ),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Page 3'),
          backgroundColor: Theme.of(context).accentColor,
          elevation: 2.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        body: Center(
          child: MaterialButton(
            child: Text('Go home'),
            onPressed: () => Navigator.popUntil(
                context, ModalRoute.withName(Navigator.defaultRouteName)),

            //or use a string <'/'> for getting to initial page.
            //replace <Navigator.defaultRouteName> with any routeName.
          ),
        ),
      );
}
