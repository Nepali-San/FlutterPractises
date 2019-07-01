import 'dart:convert' as json;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'articles.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  int get id;

  @nullable
  bool get deleted;

  String get type;
  String get by;
  int get time;

  @nullable
  String get text;

  @nullable
  bool get dead;

  @nullable
  int get poll;

  @nullable
  int get parent;

  BuiltList<int> get kids;

  @nullable
  String get url;

  @nullable
  int get score;

  @nullable
  String get title;

  BuiltList<int> get parts;

  @nullable
  int get descendants;

  Article._();

  static Serializer<Article> get serializer => _$articleSerializer;
  factory Article([updates(ArticleBuilder b)]) = _$Article;
}

List<int> parseTopStories(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  final listofIds = List<int>.from(parsed);
  print(listofIds);
  return listofIds;
}

Article parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  Article article = standardSerializers.deserializeWith(Article.serializer, parsed);
  print(article);
  return article;
}