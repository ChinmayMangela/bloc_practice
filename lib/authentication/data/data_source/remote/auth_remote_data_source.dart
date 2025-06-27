import 'dart:io';
import 'package:bloc_practice/authentication/data/exceptions/auth_exception.dart';
import 'package:bloc_practice/authentication/data/exceptions/auth_exception_mapper.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import '../../model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<UserModel> getCurrentUser();

  Future<void> forgotPassword({required String email});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      if (user == null) {
        throw AuthException('User sign up failed', code: 'null-user');
      }

      await user.updateDisplayName(name);
      return UserModel(
        id: user.uid,
        name: name,
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionMapper.mapFirebaseAuthException(e);
    } on SocketException catch (e) {
      throw AuthExceptionMapper.mapSocketException(e);
    } on FormatException catch (e) {
      throw AuthExceptionMapper.mapFormatException(e);
    } catch (e) {
      throw AuthExceptionMapper.mapGenericException(e);
    }
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      if (user == null) {
        throw AuthException('User sign in failed', code: 'null-user');
      }

      return UserModel(
        id: user.uid,
        name: user.displayName!,
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionMapper.mapFirebaseAuthException(e);
    } on SocketException catch (e) {
      throw AuthExceptionMapper.mapSocketException(e);
    } on FormatException catch (e) {
      throw AuthExceptionMapper.mapFormatException(e);
    } catch (e) {
      throw AuthExceptionMapper.mapGenericException(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionMapper.mapFirebaseAuthException(e);
    } on SocketException catch (e) {
      throw AuthExceptionMapper.mapSocketException(e);
    } on FormatException catch (e) {
      throw AuthExceptionMapper.mapFormatException(e);
    } catch (e) {
      throw AuthExceptionMapper.mapGenericException(e);
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionMapper.mapFirebaseAuthException(e);
    } on SocketException catch (e) {
      throw AuthExceptionMapper.mapSocketException(e);
    } on FormatException catch (e) {
      throw AuthExceptionMapper.mapFormatException(e);
    } catch (e) {
      throw AuthExceptionMapper.mapGenericException(e);
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        throw AuthException('User not found', code: 'null-user');
      }
      return UserModel(
        id: user.uid,
        name: user.displayName!,
        email: user.email!,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionMapper.mapFirebaseAuthException(e);
    } on SocketException catch (e) {
      throw AuthExceptionMapper.mapSocketException(e);
    } on FormatException catch (e) {
      throw AuthExceptionMapper.mapFormatException(e);
    } catch (e) {
      throw AuthExceptionMapper.mapGenericException(e);
    }
  }
}
