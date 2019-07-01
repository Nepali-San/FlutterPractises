import 'dart:async';

import 'package:news_app/model/articles.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';

enum StoriesType { topstories, newstories }

class HackerNewsBloc {
  static List<int> _newIds = [
    19837981,
    19838123,
    19836922,
    19835608,
  ];

  static List<int> _topIds = [
    19837968,
    19835615,
    19812705,
    19811861,
  ];

  Stream<UnmodifiableListView<Article>> get articles => _articleSubject.stream;
  final _articleSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  final _storiesTypeController = StreamController<StoriesType>();
  var _articles = <Article>[];

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;

  HackerNewsBloc() {
    _getArticleAndUpdate(_topIds);

    _storiesTypeController.stream.listen((storyType) {
      if (storyType == StoriesType.newstories) {
        _getArticleAndUpdate(_topIds);
      } else {
        _getArticleAndUpdate(_newIds);
      }
    });
  }

  _getArticleAndUpdate(List<int> ids) {
    _updateArticles(ids).then((_) {
      _articleSubject.add(UnmodifiableListView(_articles));
    });
  }

  Future _updateArticles(List<int> idList) async {
    final futureArticles = idList.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _articles = articles;
  }

  Future<Article> _getArticle(id) async {
    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final storyRes = await http.get(storyUrl);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    } else {
      print('unable to parse');
      return null;
    }
  }
}
