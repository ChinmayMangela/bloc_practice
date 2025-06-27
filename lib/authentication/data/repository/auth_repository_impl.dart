import 'package:bloc_practice/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:bloc_practice/authentication/data/failures/failure.dart';
import 'package:bloc_practice/authentication/domain/entities/user.dart';
import 'package:bloc_practice/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
      : _authRemoteDataSource = authRemoteDataSource;

  final AuthRemoteDataSource _authRemoteDataSource;

  @override
  Future<Either<Failure, User>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authRemoteDataSource.signUpWithEmailAndPassword(
          name: name, email: email, password: password);

      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authRemoteDataSource.signInWithEmailAndPassword(
          email: email, password: password);

      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _authRemoteDataSource.signOut();
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
   try {
     await _authRemoteDataSource.forgotPassword(email: email);
     return right(null);
   } catch (e) {
     return left(Failure(e.toString()));
   }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
}
