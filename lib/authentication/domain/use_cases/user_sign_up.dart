import 'package:bloc_practice/authentication/domain/entities/user.dart';
import 'package:bloc_practice/authentication/domain/repository/auth_repository.dart';
import 'package:bloc_practice/common/use_case/use_case.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/failures/failure.dart';

class UserSignUp implements UseCase<User, SignUpParameter> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(SignUpParameter params) {
    return authRepository.signUpWithEmail(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParameter {
  final String name;
  final String email;
  final String password;

  SignUpParameter({
    required this.name,
    required this.email,
    required this.password,
  });
}
