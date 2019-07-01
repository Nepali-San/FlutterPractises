import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

//initial state of the LoginForm.
class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

//state of the LoginForm when we are validating credentials
class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';
}

//state of the LoginForm when a login attempt has failed.
class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'LoginFailure { error: $error }';
}
