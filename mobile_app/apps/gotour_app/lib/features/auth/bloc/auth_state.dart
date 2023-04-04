part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class AuthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}

// This is the initial state of the bloc.
// When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthErrorState extends AuthState {
  AuthErrorState(this.error);

  final String error;
  @override
  List<Object?> get props => [error];
}

class ErrorForgotPassword extends AuthState {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordSubmitedState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignUpSubmitedState extends AuthState {
  @override
  List<Object?> get props => [];
}

class UnVerifyEmailState extends AuthState {
  @override
  List<Object?> get props => [];
}
