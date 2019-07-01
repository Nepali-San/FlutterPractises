import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:infinite_list/model/post.dart';
import 'package:infinite_list/post_event.dart';
import 'package:infinite_list/post_state.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;
  PostBloc({@required this.httpClient});

  bool _hasReachedMax(PostState state) =>
      state is PostLoaded && state.hasReachedMax;

  @override
  PostState get initialState => PostUnitialized();

  @override
  Stream<PostState> mapEventToState(event) async* {
    if (event is FetchEvent && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostUnitialized) {
          final posts = await _fetchPosts(0, 20);
          yield PostLoaded(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is PostLoaded) {
          final posts =
              await _fetchPosts((currentState as PostLoaded).posts.length, 20);
          yield posts.isEmpty
              ? (currentState as PostLoaded).copyWith(hasReachedMax: true)
              : PostLoaded(
                  posts: (currentState as PostLoaded).posts + posts,
                  hasReachedMax: false,
                );
        }
      } catch (e) {
        yield PostError();
      }
    }
  }

  @override
  Stream<PostState> transform(
    Stream<PostEvent> events,
    Stream<PostState> Function(PostEvent event) next,
  ) {
    print('let me bounce');
    return super.transform(
      (events as Observable<PostEvent>).debounce(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    final response = await httpClient.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return Post(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}
