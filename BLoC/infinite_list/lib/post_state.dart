import 'package:equatable/equatable.dart';
import 'model/post.dart';

abstract class PostState extends Equatable {
  PostState([List props = const []]) : super(props);
}

class PostUnitialized extends PostState {
  @override
  String toString() => "Post uninitailized";
}

class PostError extends PostState {
  @override
  String toString() => "Post Error";
}

class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  PostLoaded({this.posts, this.hasReachedMax}) : super([posts, hasReachedMax]);

  @override
  String toString() => "Post Loaded";

  PostLoaded copyWith({List<Post> posts, bool hasReachedMax}) {
    //var v = a ?? b ;
    //v = a but if a is null v = b;
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
