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

// If forgot password error, state is changed to ErrorForgotPassword
class ErrorForgotPassword extends AuthState {
  ErrorForgotPassword({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

// If forgot password error, state is changed to ForgotPasswordSubmited
class ForgotPasswordSubmitedState extends AuthState {
  @override
  List<Object?> get props => [];
}

// If SignUp success, state is changed to SignUpSubmitedState
class SignUpSubmitedState extends AuthState {
  @override
  List<Object?> get props => [];
}

// If email unverify, state is changed to UnVerifyEmailState
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

class ValueChangedLoadingState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ValueChangedSuccessState extends AuthState {
  ValueChangedSuccessState({required this.value});

  final String value;

  @override
  List<Object?> get props => [value];
}

class ValueChangedErrorState extends AuthState {
  ValueChangedErrorState({this.error});

  final String? error;
  @override
  List<Object?> get props => throw UnimplementedError();
}
