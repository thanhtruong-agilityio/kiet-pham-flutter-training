part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// When the user signing in with email and password this event is called
// And the [AuthRepository] is called to sign in the user
class SignInRequestedEvent extends AuthEvent {
  SignInRequestedEvent(this.email, this.password);

  final String email;
  final String password;
}

// When the user signing up with email and password this event is called
// And the [AuthRepository] is called to sign up the user
class SignUpRequestedEvent extends AuthEvent {
  SignUpRequestedEvent({
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
class ForgotPasswordRequestedEvent extends AuthEvent {
  ForgotPasswordRequestedEvent(this.email);

  final String email;
}

// When the user signing in with google this event is called
//And the [AuthRepository] is called to sign in the user
class GoogleSignInRequestedEvent extends AuthEvent {}

// When the user signing out this event is called
//And the [AuthRepository] is called to sign out the user
class SignOutRequestedEvent extends AuthEvent {}

class TermsRequestedEvent extends AuthEvent {
  TermsRequestedEvent({required this.value});

  final bool value;
}
