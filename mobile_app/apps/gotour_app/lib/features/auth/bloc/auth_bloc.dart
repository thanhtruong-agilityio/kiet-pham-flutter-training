// import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/features/auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(UnAuthenticatedState()) {
    // When User Presses the SignIn Button, we will send
    // the SignInRequested Event to the AuthBloc to handle it and
    // emit the Authenticated State if the user is authenticated
    on<SignInRequestedEvent>(_handleSignIn);
    // When User Presses the SignUp Button, we will send
    //the SignUpRequest Event to the AuthBloc to handle it and
    // emit the Authenticated State if the user is authenticated
    on<SignUpRequestedEvent>(_handleSignUp);
    // When User Presses the Google Login Button, we will send
    // the GoogleSignInRequest Event to the AuthBloc to handle it and
    // emit the Authenticated State if the user is authenticated
    on<GoogleSignInRequestedEvent>(_handleGoogleSignIn);
    // When User Presses the SignOut Button, we will send
    // the SignOutRequested Event to the AuthBloc to handle it and
    // emit the UnAuthenticated State
    on<SignOutRequestedEvent>(_handleSignOut);
    // When User Presses the Forgot Password Button, we will send
    // the ForgotPasswordRequested Event to the AuthBloc to handle it and
    // emit the UnAuthenticated State
    on<ForgotPasswordRequestedEvent>(_handleForgotPassword);
    // When User Presses the checkbox terms,
    // we will send TermsRequested Event to AuthBloc to handle it
    // and emit the TermsRequestSuccess
    on<TermsRequestedEvent>(_handleTermsRequest);
  }

  final AuthRepository authRepository;

  Future<void> _handleSignIn(
    SignInRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // emit loading state
      emit(LoginLoadingState());

      // firebase check email and password
      await authRepository.signIn(email: event.email, password: event.password);

      // firebase  check email is verified?
      final isVerifyEmail = FirebaseAuth.instance.currentUser!.emailVerified;

      // if email is verified, change state to authenticated
      // and if email isn't verified change state UnAuthenticated State
      if (isVerifyEmail) {
        //emit authenticated state
        emit(AuthenticatedState());
      } else {
        // emit unauthenticated state
        emit(UnVerifyEmailState());
      }
    } on Exception catch (e) {
      // emit error case
      emit(AuthErrorState(e.toString()));
    }
  }

  Future<void> _handleSignUp(
    SignUpRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // emit loading state
      emit(SignUpLoadingState());

      // request to sign up
      await authRepository.signUp(
        email: event.email,
        password: event.password,
        gender: event.gender,
      );

      // emit sign up submited state
      emit(SignUpSubmitedState());
    } on Exception catch (e) {
      // emit error case
      emit(AuthErrorState(e.toString()));
    }
  }

  Future<void> _handleGoogleSignIn(
    GoogleSignInRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // emit loading state
      emit(LoginWithGoogleLoadingState());

      // request to sign in with Google
      await authRepository.signInWithGoogle();

      //emit authentication state
      emit(AuthenticatedState());
    } on Exception catch (e) {
      // emit error case
      emit(AuthErrorState(e.toString()));
    }
  }

  Future<void> _handleSignOut(
    SignOutRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // emit loading state
      emit(LogOutLoadingState());

      // request signout
      await authRepository.signOut();

      // emit unauthenticated state
      emit(UnAuthenticatedState());
    } on Exception catch (e) {
      //emit error case
      emit(AuthErrorState(e.toString()));
    }
  }

  Future<void> _handleForgotPassword(
    ForgotPasswordRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // emit loading state
      emit(ForgotPasswordLoadingState());

      // request forgot password
      await authRepository.forgotPassword(email: event.email);

      // emit forgot password submited state
      emit(ForgotPasswordSubmitedState());
    } on Exception catch (e) {
      // emit erorr case
      emit(AuthErrorState(e.toString()));
    }
  }

  Future<void> _handleTermsRequest(
    TermsRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final enabled = event.value;
      emit(TermRequestSuccessState(enabled: enabled));
    } on Exception catch (e) {
      emit(TermRequestFailureState(error: e.toString()));
    }
  }
}
