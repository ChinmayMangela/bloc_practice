import 'package:bloc_practice/authentication/data/exceptions/auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../utils/utils.dart';
import '../../model/end_user.dart';

class AuthRemoteDataSource {
  const AuthRemoteDataSource({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      AuthExceptions.handleAuthException(e);
    } on FormatException catch (e) {
      AuthExceptions.handleFormatException(e);
    } catch (e) {
      AuthExceptions.handelGenericException(e);
    }
  }

  Future<void> signUpWithEmail({required EndUser user}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException catch (e) {
      AuthExceptions.handleAuthException(e);
    } on FormatException catch (e) {
      AuthExceptions.handleFormatException(e);
    } catch (e) {
      AuthExceptions.handelGenericException(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      AuthExceptions.handleAuthException(e);
    } on FormatException catch (e) {
      AuthExceptions.handleFormatException(e);
    } catch (e) {
      AuthExceptions.handelGenericException(e);
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      Utils.showSnackBar('Password reset email sent.');
    } on FirebaseAuthException catch (e) {
      AuthExceptions.handleAuthException(e);
    } on FormatException catch (e) {
      AuthExceptions.handleFormatException(e);
    } catch (e) {
      AuthExceptions.handelGenericException(e);
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _firebaseAuth.currentUser!.sendEmailVerification();
      Utils.showSnackBar('Verification email sent.');
    } on FirebaseAuthException catch (e) {
      AuthExceptions.handleAuthException(e);
    } on FormatException catch (e) {
      AuthExceptions.handleFormatException(e);
    } catch (e) {
      AuthExceptions.handelGenericException(e);
    }
  }
}
