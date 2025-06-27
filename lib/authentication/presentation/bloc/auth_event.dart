import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

final class AuthSignInRequested extends AuthEvent {
  final String email;
  final String password;

  AuthSignInRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

final class AuthSignUpRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;

  AuthSignUpRequested(this.name, this.email, this.password);

  @override
  List<Object?> get props => [name, email, password];
}

final class AuthSignOutRequested extends AuthEvent {
  AuthSignOutRequested();

  @override
  List<Object?> get props => [];
}

final class AuthForgotPasswordRequested extends AuthEvent {
  final String email;

  AuthForgotPasswordRequested(this.email);

  @override
  List<Object?> get props => [email];
}
