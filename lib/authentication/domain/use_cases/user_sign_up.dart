import 'package:bloc_practice/authentication/domain/entities/user.dart';
import 'package:bloc_practice/authentication/domain/repository/auth_repository.dart';
import 'package:bloc_practice/common/use_case/use_case.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/failures/failure.dart';

class UserSignUp implements UseCase<User, UserSignUpParameter> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParameter params) {
    return authRepository.signUpWithEmail(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParameter {
  final String name;
  final String email;
  final String password;

  UserSignUpParameter({
    required this.name,
    required this.email,
    required this.password,
  });
}
