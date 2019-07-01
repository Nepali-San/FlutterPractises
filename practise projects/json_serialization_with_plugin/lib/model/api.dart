import 'reddit.dart';
import 'serializers.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const String base_url = "https://www.reddit.com/r/popular/new.json?count=25";

Future<List<Post>> getReddit() async{
  final response = await http.get(Uri.parse(base_url));
  Reddit reddit = serializers.deserializeWith(Reddit.serializer, json.decode(response.body));

  return reddit.data.children.map((d) => d.data).toList();

}
