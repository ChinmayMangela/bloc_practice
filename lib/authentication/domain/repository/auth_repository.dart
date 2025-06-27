

import 'package:bloc_practice/authentication/data/model/user_model.dart';

abstract class AuthRepository {
  Future<void> signInWithEmail(String email, String password);
  Future<void> signUpWithEmail(UserModel user);
  Future<void> signOut();
  Future<void> sendEmailVerification();
  Future<void> resetPassword(String email);
  Future<void> signInWithGoogle();
  Future<bool?> checkEmailVerified();
}