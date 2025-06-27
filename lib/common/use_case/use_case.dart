

import 'package:bloc_practice/authentication/data/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Parameters> {
  Future<Either<Failure, SuccessType>> call(Parameters params);
}
