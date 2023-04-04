import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance.collection('users');

  Object _mapFirebaseUser({required User user, required int gender}) {
    var splittedName = ['Name ', 'LastName'];
    if (user.displayName != null) {
      splittedName = user.displayName!.split(' ');
    }

    final map = <String, dynamic>{
      'id': user.uid,
      'firstName': splittedName.first,
      'lastName': splittedName.last,
      'email': user.email ?? '',
      'imageUrl': user.photoURL ?? '',
      'age': '',
      'gender': gender,
      'phoneNumber': '',
      'address': '',
    };
    return map;
  }

  Future<void> signUp({
    required String email,
    required String password,
    required int gender,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = _firebaseAuth.currentUser;
      await _firebaseFirestore.doc(user!.uid).set(
            _mapFirebaseUser(
              user: userCredential.user!,
              gender: gender,
            ) as Map<String, dynamic>,
          );
      await _firebaseAuth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw Exception(_determineError(e));
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await _firebaseFirestore.get();
    } on FirebaseAuthException catch (e) {
      throw Exception(_determineError(e));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final authResult = await _firebaseAuth.signInWithCredential(credential);
      final user = authResult.user != null;
      print(user);
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(_determineError(e));
    }
  }

  Future<void> forgotPassword({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
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
      case 'account-exists-with-different-credential':
        return AuthError.accountExistsWithDifferentCredential.value;
      case 'invalid-credential':
        return AuthError.invalidCredential.value;
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
  invalidCredential,
  accountExistsWithDifferentCredential,
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
      case AuthError.accountExistsWithDifferentCredential:
        return '''An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address''';
      case AuthError.invalidCredential:
        return '''An account already exists with the same email address but different sign-in credentials.''';
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
