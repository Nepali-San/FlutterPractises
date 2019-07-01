import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {}

class FetchEvent extends PostEvent {
  @override
  String toString() => "FetchEvent";
}
