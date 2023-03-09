part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthError extends AuthState {
  AuthError(this.error);

  final String error;
  @override
  List<Object?> get props => [error];
}

class ErrorForgotPassword extends AuthState {
  @override
  List<Object?> get props => [];
}

class SubmitForgotPassword extends AuthState {
  @override
  List<Object?> get props => [];
}
