// import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/features/auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<SignInRequested>(_handleSignInRequested);
    // When User Presses the SignUp Button, we will send the SignUpRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<SignUpRequested>(_handleSignUpRequested);
    // When User Presses the Google Login Button, we will send the GoogleSignInRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<GoogleSignInRequested>(_handleGoogleSignInRequested);
    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<SignOutRequested>(_handleSignOutRequested);
  }

  final AuthRepository authRepository;

  Future<void> _handleSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authRepository.signIn(email: event.email, password: event.password);
      emit(Authenticated());
    } on Exception catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  Future<void> _handleSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authRepository.signUp(email: event.email, password: event.password);
      emit(Authenticated());
    } on Exception catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  Future<void> _handleGoogleSignInRequested(
    GoogleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authRepository.signInWithGoogle();
      emit(Authenticated());
    } on Exception catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  Future<void> _handleSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    await authRepository.signOut();
    emit(UnAuthenticated());
  }
}
