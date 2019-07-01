import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:news_app/model/hn_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_app/model/articles.dart';

void main() {
  final hnBloc = HackerNewsBloc();
  runApp(MyApp(hnBloc));
}

class MyApp extends StatelessWidget {
  final HackerNewsBloc hnBloc;
  MyApp(this.hnBloc);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Hacker News', hnBloc: hnBloc),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.hnBloc}) : super(key: key);

  final String title;
  final HackerNewsBloc hnBloc;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
        stream: widget.hnBloc.articles,
        initialData: UnmodifiableListView<Article>([]),
        builder: (context, snapshot) {
          return ListView(
            children: snapshot.data.map((showArticle)).toList(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIdx,
        items: [
          BottomNavigationBarItem(
            title: Text("Top stories"),
            icon: Icon(Icons.arrow_drop_up),
          ),
          BottomNavigationBarItem(
            title: Text("New stories"),
            icon: Icon(Icons.new_releases),
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            widget.hnBloc.storiesType.add(StoriesType.topstories);
            setState(() {
              _currentIdx = 0;
            });
          } else {
            widget.hnBloc.storiesType.add(StoriesType.newstories);
            setState(() {
              _currentIdx = 1;
            });
          }
        },
      ),
    );
  }

  Widget showArticle(Article n) {
    return ExpansionTile(
      key: Key(n.title ?? 'null'),
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 3.0),
        child: Text(
          n.title ?? 'null',
          style: TextStyle(fontSize: 35.0),
        ),
      ),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Score : ${n.score}'),
            IconButton(
              icon: Icon(
                Icons.open_in_new,
                color: Colors.green,
              ),
              onPressed: () async {
                if (await canLaunch(n.url)) {
                  await launch(n.url);
                } else {
                  throw "Can't launch url";
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
