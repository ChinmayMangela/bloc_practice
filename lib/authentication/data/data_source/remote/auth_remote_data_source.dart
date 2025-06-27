import 'package:bloc_practice/authentication/data/exceptions/auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../utils/utils.dart';
import '../../model/user_model.dart';

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
      AuthExceptions.handleGenericException(e);
    }
  }

  Future<void> signUpWithEmail({required UserModel user}) async {
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
      AuthExceptions.handleGenericException(e);
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
      AuthExceptions.handleGenericException(e);
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
      AuthExceptions.handleGenericException(e);
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
      AuthExceptions.handleGenericException(e);
    }
  }

  Future<void> signInWithGoogle() async {
    // Triggers the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if(googleUser == null) {
      throw AuthException('Google sign in cancelled by user');
    }

    // obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // creates a new credentials
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    // i will add the function for saving the credentials
  }

  Future<bool?> checkEmailVerified() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.reload();
      return user?.emailVerified;
    } on FirebaseAuthException catch (e) {
      AuthExceptions.handleAuthException(e);
      return null;
    } on FormatException catch (e) {
      AuthExceptions.handleFormatException(e);
      return null;
    } catch (e) {
      AuthExceptions.handleGenericException(e);
      return null;
    }
  }
}
