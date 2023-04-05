part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class LoginLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignUpLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginWithGoogleLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LogOutLoadingState extends AuthState {
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
  ErrorForgotPassword({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
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

class TermRequestSuccessState extends AuthState {
  TermRequestSuccessState({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

class TermRequestFailureState extends AuthState {
  TermRequestFailureState({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}
