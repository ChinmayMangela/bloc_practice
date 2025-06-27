import 'dart:io';

import 'package:bloc_practice/authentication/data/exceptions/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../common/exceptions/firebase_auth_error_codes.dart';

class AuthExceptionMapper {
  static AuthException mapFirebaseAuthException(FirebaseAuthException e) {
    if (kDebugMode) {
      print('Firebase Auth Exception - Message: ${e.message}, code: ${e.code}');
    }

    String? errorMessage;
    switch (e.code) {
      case FirebaseAuthErrorCodes.invalidEmail:
        errorMessage = 'Invalid email address.';
        break;
      case FirebaseAuthErrorCodes.userDisabled:
        errorMessage = 'This user account has been disabled.';
        break;
      case FirebaseAuthErrorCodes.userNotFound:
        errorMessage = 'No user found for that email.';
        break;
      case FirebaseAuthErrorCodes.wrongPassword:
        errorMessage = 'Incorrect password.';
        break;
      case FirebaseAuthErrorCodes.emailAlreadyInUse:
        errorMessage = 'This email is already in use.';
        break;
      case FirebaseAuthErrorCodes.operationNotAllowed:
        errorMessage = 'Email/password accounts are not enabled.';
        break;
      case FirebaseAuthErrorCodes.weakPassword:
        errorMessage = 'The password is too weak.';
        break;
      case FirebaseAuthErrorCodes.networkRequestFailed:
        errorMessage = 'Network error, please try again.';
        break;
      case FirebaseAuthErrorCodes.tooManyRequests:
        errorMessage = 'Too many attempts, please try later.';
        break;
      case FirebaseAuthErrorCodes.invalidCredential:
        errorMessage = 'Invalid credentials.';
        break;
      default:
        errorMessage = 'Authentication error: ${e.message}';
    }

    throw AuthException(errorMessage, code: e.code);
  }

  static AuthException mapFormatException(FormatException e) {
    if (kDebugMode) {
      print('Format Exception - Message: ${e.message}');
    }

    throw AuthException(e.message, code: 'format-exception');
  }

  static AuthException mapGenericException(Object e) {
    if (kDebugMode) {
      print('Generic Exception - Message: $e');
    }
    throw AuthException('Authentication error: $e', code: 'generic-exception');
  }

  static AuthException mapSocketException(SocketException e) {
    if (kDebugMode) {
      print('Socket Exception - Message: ${e.message}, code: ${e.osError?.errorCode}');
    }
    throw AuthException(
      'No internet connection or server unreachable. Please check your network',
      code: 'network-unavailable',
    );
  }
}
