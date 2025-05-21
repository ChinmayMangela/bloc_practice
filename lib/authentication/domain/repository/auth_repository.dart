

import 'package:bloc_practice/authentication/data/model/end_user.dart';

abstract class AuthRepository {
  Future<void> signIn(String email, String password);
  Future<void> signUp(EndUser user);
  Future<void> signOut();
  Future<void> sendEmailVerification();
  Future<void> resetPassword(String email);
}