import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

//event to notify the bloc that it needs to check if 
//the user is currently authenticated or not.
class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

//event to notify the bloc that the user has successfully logged in.
class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({@required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

//event to notify the bloc that the user has successfully logged out.
class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}
