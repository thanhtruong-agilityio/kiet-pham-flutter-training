part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// When the user signing in with email and password this event is called
// And the [AuthRepository] is called to sign in the user
class SignInRequested extends AuthEvent {
  SignInRequested(this.email, this.password);

  final String email;
  final String password;
}

// When the user signing up with email and password this event is called
// And the [AuthRepository] is called to sign up the user
class SignUpRequested extends AuthEvent {
  SignUpRequested({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.gender,
  });

  final String email;
  final String password;
  final String confirmPassword;
  final int gender;
}

// When the user request forgot password this event is called
class ForgotPasswordRequested extends AuthEvent {
  ForgotPasswordRequested(this.email);

  final String email;
}

// When the user signing in with google this event is called
//And the [AuthRepository] is called to sign in the user
class GoogleSignInRequested extends AuthEvent {}

// When the user signing out this event is called
//And the [AuthRepository] is called to sign out the user
class SignOutRequested extends AuthEvent {}
