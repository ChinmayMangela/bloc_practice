import 'package:bloc_practice/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:bloc_practice/authentication/data/model/end_user.dart';
import 'package:bloc_practice/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
      : _authRemoteDataSource = authRemoteDataSource;

  final AuthRemoteDataSource _authRemoteDataSource;

  @override
  Future<void> resetPassword(String email) async {
    await _authRemoteDataSource.forgotPassword(email: email);
  }

  @override
  Future<void> sendEmailVerification() async {
    await _authRemoteDataSource.sendEmailVerification();
  }

  @override
  Future<void> signInWithEmail(String email, String password) async {
    await _authRemoteDataSource.signInWithEmail(
        email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _authRemoteDataSource.signOut();
  }

  @override
  Future<void> signUpWithEmail(EndUser user) async {
    await _authRemoteDataSource.signUpWithEmail(user: user);
  }

  @override
  Future<void> signInWithGoogle() async {
    await _authRemoteDataSource.signInWithGoogle();
  }

  @override
  Future<bool?> checkEmailVerified() async {
    return await _authRemoteDataSource.checkEmailVerified();
  }
}
