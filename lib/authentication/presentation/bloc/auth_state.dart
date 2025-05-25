import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

final class AuthInitial extends AuthState {
  AuthInitial();

  @override
  List<Object?> get props => [];
}

final class AuthLoading extends AuthState {
  AuthLoading();

  @override
  List<Object?> get props => [];
}

final class Authenticated extends AuthState {
  Authenticated();

  @override
  List<Object?> get props => [];
}

final class UnAuthenticated extends AuthState {
  UnAuthenticated();

  @override
  List<Object?> get props => [];
}

final class AuthError extends AuthState {
  final String errorMessage;
  AuthError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class AuthInfo extends AuthState {
  final String message;
  AuthInfo(this.message);

  @override
  List<Object?> get props => [message];
}

class EmailVerified extends AuthState {
  EmailVerified();

  @override
  List<Object?> get props => [];
}

class EmailNotVerified extends AuthState {
  EmailNotVerified();

  @override
  List<Object?> get props => [];
}
