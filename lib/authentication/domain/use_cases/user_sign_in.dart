import 'package:bloc_practice/authentication/domain/entities/user.dart';
import 'package:bloc_practice/authentication/domain/repository/auth_repository.dart';
import 'package:bloc_practice/common/use_case/use_case.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/failures/failure.dart';

class UserSignIn implements UseCase<User, UserSignInParameters> {
  final AuthRepository authRepository;

  UserSignIn(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignInParameters params) async {
    return await authRepository.signInWithEmail(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParameters {
  final String email;
  final String password;

  UserSignInParameters({required this.email, required this.password});
}
