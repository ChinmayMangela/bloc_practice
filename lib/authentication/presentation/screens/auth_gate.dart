

import 'package:bloc_practice/authentication/presentation/screens/email_verification_screen.dart';
import 'package:bloc_practice/authentication/presentation/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../todo/presentation/screens/todo_home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
      if(snapshot.hasData) {
        return const EmailVerificationScreen();
      } else {
        return const SignInScreen();
      }
    });
  }
}
