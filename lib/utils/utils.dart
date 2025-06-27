import 'package:flutter/material.dart';
import '../main.dart';

class Utils {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static void showSnackBar(String? message) {
    if (message == null) return;

    final snackBar = SnackBar(content: Text(message));

    scaffoldMessengerKey.currentState
      ?..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showCircularProgressIndicator(BuildContext context) {
    Center(
      child: CircularProgressIndicator(),
    );
  }

  static String? nameValidator(String? name) {
    if(name == null || name.isEmpty) {
      return 'Name cannot be empty';
    }

    if(name.length < 3) {
      return 'Name length must be at least 3 characters';
    }

    if(name.length > 20) {
      return 'Name length cannot exceed 20 characters';
    }

    return null;
  }

  static String? emailValidator(String? email) {
    if(email == null || email.isEmpty) {
      return 'Email cannot be empty';
    }

    final emailRegex = RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? passwordValidator(String? password) {
    if(password == null || password.isEmpty) {
      return "Password cannot be empty";
    }

    if(password.length < 8) {
      return "Password length must be at least 8 characters";
    }
    return null;
  }

  static String? confirmPasswordValidator(String? confirmPassword, String password) {
    if(confirmPassword == null || confirmPassword.isEmpty) {
      return "Password cannot be empty";
    }

    if(confirmPassword != password) {
      return "Passwords do not match";
    }

    return null;
  }
}
