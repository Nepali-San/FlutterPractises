abstract class PostEvent {}

class FetchEvent extends PostEvent {
  @override
  String toString() => "FetchEvent";
}
