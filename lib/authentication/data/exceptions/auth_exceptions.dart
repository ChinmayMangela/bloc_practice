import 'package:bloc_practice/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AuthExceptions {
  static void handleAuthException(FirebaseException exception) {
    if (kDebugMode) print(exception.message!);
    Utils.showSnackBar(exception.toString());

    switch (exception.code) {
      case 'invalid-email':
        Utils.showSnackBar('Invalid email address.');
        break;

      case 'user-disabled':
        Utils.showSnackBar('This user account has been disabled.');
        break;

      case 'user-not-found':
        Utils.showSnackBar('No user found for that email.');
        break;

      case 'wrong-password':
        Utils.showSnackBar('Incorrect password.');
        break;

      case 'email-already-in-use':
        Utils.showSnackBar('This email is already in use.');
        break;

      case 'operation-not-allowed':
        Utils.showSnackBar('Email/password accounts are not enabled.');
        break;

      case 'weak-password':
        Utils.showSnackBar('The password is too weak.');
        break;

      case 'network-request-failed':
        Utils.showSnackBar('Network error, please try again.');
        break;

      case 'too-many-requests':
        Utils.showSnackBar('Too many attempts, please try later.');
        break;

      default:
        Utils.showSnackBar('Authentication error: ${exception.message}');
    }
  }

  static void handelGenericException(Exception exception) {
    if (kDebugMode) print(exception);
    Utils.showSnackBar(exception.toString());
  }

  static void handleFormatException(FormatException exception) {
    if (kDebugMode) print(exception);
    Utils.showSnackBar(exception.toString());
  }
}
