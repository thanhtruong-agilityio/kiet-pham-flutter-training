import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gotour_app/features/auth/models/user_entity.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance.collection('users');
  final _googleSignIn = GoogleSignIn();
  bool get isLoggedInGoogle => _googleSignIn.currentUser != null;
  GoogleSignIn get googleSignIn => _googleSignIn;

  Future<void> signUp({
    required String email,
    required String password,
    required int gender,
  }) async {
    try {
      // create account with email and password
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = _firebaseAuth.currentUser;
      final userEntity = UserEntity(
        id: user?.uid ?? '',
        email: email,
        gender: gender,
      );

      // add user entity to cloud firebase
      await _firebaseFirestore.doc(user?.uid).set(userEntity.toJson());

      // send the verification link to the email you just created
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      // case error
      throw Exception(_determineError(e));
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // check account verification
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // case error
      throw Exception(_determineError(e));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken ?? '',
        idToken: googleAuth?.idToken ?? '',
      );

      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      // case error
      throw Exception(e);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    try {
      // handel sign out
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      // case error
      throw Exception(_determineError(e));
    }
  }

  Future<void> forgotPassword({
    required String email,
  }) async {
    try {
      // handle forgot password
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      // case error
      throw Exception(_determineError(e));
    }
  }

  Object _determineError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return AuthError.invalidEmail.value;
      case 'user-disabled':
        return AuthError.userDisabled.value;
      case 'user-not-found':
        return AuthError.userNotFound.value;
      case 'wrong-password':
        return AuthError.wrongPassword.value;
      case 'email-already-in-use':
        return AuthError.emailAlreadyInUse.value;
      case 'operation-not-allowed':
        return AuthError.operationNotAllowed.value;
      case 'weak-password':
        return AuthError.weakPassword.value;
      case 'ERROR_MISSING_GOOGLE_AUTH_TOKEN':
        return AuthError.missingGoogleAuthToken.value;
      case 'sign_in_canceled':
        return AuthError.signInCanceled.value;
      case 'network-request-failed':
        return AuthError.networkError.value;
      default:
        return AuthError.error.value;
    }
  }
}

enum AuthError {
  invalidEmail,
  userDisabled,
  userNotFound,
  wrongPassword,
  emailAlreadyInUse,
  operationNotAllowed,
  missingGoogleAuthToken,
  signInCanceled,
  networkError,
  weakPassword,
  error,
}

extension AuthErrorExtension on AuthError {
  String get value {
    switch (this) {
      case AuthError.invalidEmail:
        return 'The email address is badly formatted.';
      case AuthError.userDisabled:
        return 'The user account has been disabled by an administrator.';
      case AuthError.userNotFound:
        return 'There is no user record corresponding to this identifier.';
      case AuthError.wrongPassword:
        return 'The password is invalid.';
      case AuthError.emailAlreadyInUse:
        return 'The email address is already in use by another account.';
      case AuthError.operationNotAllowed:
        return '''The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.''';
      case AuthError.weakPassword:
        return 'The password provided is too weak.';
      case AuthError.missingGoogleAuthToken:
        return 'Missing Google Auth Token';
      case AuthError.signInCanceled:
        return 'The sign-in process has been canceled.';
      case AuthError.networkError:
        return '''A network error (such as timeout, interrupted connection or unreachable host) has occurred.''';
      case AuthError.error:
        return 'An unknown error';
    }
  }
}
