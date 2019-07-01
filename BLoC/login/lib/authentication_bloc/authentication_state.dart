import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

//waiting to see if the user is authenticated or not on app start.
//user might be seeing a splash screen.
class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';
}

//successfully authenticated
//user might see a home screen
class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

//not authenticated
//user might see a login form
class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

//waiting to persist/delete a token
//user might be seeing a progress indicator
class AuthenticationLoading extends AuthenticationState {
  
  //message like 'loggin in' or 'logging out'
  final String message;

  AuthenticationLoading({this.message});
  @override
  String toString() => 'AuthenticationLoading';
}
