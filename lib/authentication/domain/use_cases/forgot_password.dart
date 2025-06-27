import 'package:bloc_practice/authentication/domain/repository/auth_repository.dart';
import 'package:bloc_practice/common/use_case/use_case.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/failures/failure.dart';

class ForgotPassword implements UseCase<void, ForgotPasswordParameters> {
  final AuthRepository authRepository;

  ForgotPassword(this.authRepository);

  @override
  Future<Either<Failure, void>> call(
    ForgotPasswordParameters parameters,
  ) async {
    return await authRepository.forgotPassword(parameters.emailAddress);
  }
}

class ForgotPasswordParameters {
  final String emailAddress;

  ForgotPasswordParameters({required this.emailAddress});
}
