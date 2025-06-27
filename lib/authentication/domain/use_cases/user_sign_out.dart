import 'package:bloc_practice/authentication/data/failures/failure.dart';
import 'package:bloc_practice/authentication/domain/repository/auth_repository.dart';
import 'package:bloc_practice/common/use_case/use_case.dart';
import 'package:fpdart/fpdart.dart';

class UserSignOut implements UseCase<void, NoParameters> {
  final AuthRepository authRepository;

  UserSignOut(this.authRepository);

  @override
  Future<Either<Failure, void>> call(NoParameters parameters) async {
    return await authRepository.signOut();
  }
}

class NoParameters {}
