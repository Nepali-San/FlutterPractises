import 'package:flutter/material.dart';
import 'package:nested/image_carousel.dart';
import 'package:nested/list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  ScrollController _scrollviewController;

  @override
  void initState() {
    _scrollviewController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Nested view")),
        body: NestedScrollView(
          // controller: _scrollviewController,
          headerSliverBuilder: (context, isScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ImageCarousel(),
                      ],
                    ),
                  ),
                ]),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 120,
                  child: Listv(2),
                ),
              ),
              SliverAppBar(
                title: Text('Products'),
                backgroundColor: Colors.red,
                pinned: true,
              ),
            ];
          },
          body: Listv(1),
        ),
      ),
    );
  }
}
