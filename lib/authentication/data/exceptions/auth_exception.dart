import 'package:bloc_practice/common/exceptions/app_exception.dart';

class AuthException extends AppException {
  AuthException(super.message, {super.code});

  @override
  String toString() {
    return "AuthException: ${super.toString()}";
  }
}
