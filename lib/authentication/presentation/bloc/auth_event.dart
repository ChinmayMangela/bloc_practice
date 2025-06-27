
import 'package:bloc_practice/authentication/data/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

final class SignInRequested extends AuthEvent {
  final String email;
  final String password;
  SignInRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

final class SignUpRequested extends AuthEvent {
  final UserModel user;

  SignUpRequested(this.user);

  @override
  List<Object?> get props => [user];
}

final class SignOutRequested extends AuthEvent {
  SignOutRequested();

  @override
  List<Object?> get props => [];
}

final class ForgotPasswordRequested extends AuthEvent {
  final String email;
  ForgotPasswordRequested(this.email);

  @override
  List<Object?> get props => [email];
}

final class SendEmailVerificationRequested extends AuthEvent {
  SendEmailVerificationRequested();

  @override
  List<Object?> get props => [];
}

final class CheckEmailVerifiedRequested extends AuthEvent {
  CheckEmailVerifiedRequested();

  @override
  List<Object?> get props => [];
}

final class GoogleSignInRequested extends AuthEvent {
  GoogleSignInRequested();

  @override
  List<Object?> get props => [];
}