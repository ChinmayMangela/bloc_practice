import 'package:bloc_practice/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AuthException implements Exception {
  final String message;
  final String? code;

  AuthException(this.message, {this.code});

  @override
  String toString() {
    return "Auth Exception $message";
  }
}

class AuthExceptions {

  static void handleAuthException(FirebaseAuthException exception) {
    if(kDebugMode) print('${exception.code} ${exception.message}');

    String errorMessage;
    switch(exception.code) {
      case 'invalid-email':
        errorMessage = 'Invalid email address.';
        Utils.showSnackBar(errorMessage);
        break;
      case 'user-disabled':
        errorMessage = 'This user account has been disabled.';
        Utils.showSnackBar(errorMessage);
        break;
      case 'user-not-found':
        errorMessage = 'No user found for that email.';
        Utils.showSnackBar(errorMessage);
        break;
      case 'wrong-password':
        errorMessage = 'Incorrect password.';
        Utils.showSnackBar(errorMessage);
        break;
      case 'email-already-in-use':
        errorMessage = 'This email is already in use.';
        Utils.showSnackBar(errorMessage);
        break;
      case 'operation-not-allowed':
        errorMessage = 'Email/password accounts are not enabled.';
        Utils.showSnackBar(errorMessage);
        break;
      case 'weak-password':
        errorMessage = 'The password is too weak.';
        Utils.showSnackBar(errorMessage);
        break;
      case 'network-request-failed':
        errorMessage = 'Network error, please try again.';
        Utils.showSnackBar(errorMessage);
        break;
      case 'too-many-requests':
        errorMessage = 'Too many attempts, please try later.';
        Utils.showSnackBar(errorMessage);
        break;
      case 'invalid-credential':
        errorMessage = 'Invalid credentials.';
        Utils.showSnackBar(errorMessage);
        break;
      default:
        errorMessage = 'Authentication error: ${exception.message}';
    }

    throw AuthException(errorMessage, code: exception.code);
  }

  static void handleFormatException(FormatException exception) {
    if(kDebugMode) print('Format Exception: ${exception.toString()}');
    Utils.showSnackBar(exception.toString());
    throw AuthException(exception.toString());
  }

  static void handleGenericException(Object e) {
    if (kDebugMode) print('Generic Exception:- ${e.toString()}');
    String errorMessage = 'An unexpected error occurred.';
    if (e.toString().contains('Google sign in cancelled by user')) {
      errorMessage = 'Google sign in was cancelled.';
      Utils.showSnackBar(errorMessage);
      return;
    }
    Utils.showSnackBar(errorMessage);
    throw AuthException(errorMessage, code: 'generic-error');
  }
}