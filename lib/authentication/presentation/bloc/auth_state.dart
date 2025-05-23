import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

final class AuthInitial extends AuthState {
  AuthInitial();

  @override
  List<Object?> get props => throw UnimplementedError();
}

final class AuthLoading extends AuthState {
  AuthLoading();

  @override
  List<Object?> get props => throw UnimplementedError();
}

final class Authenticated extends AuthState {
  Authenticated();

  @override
  List<Object?> get props => throw UnimplementedError();
}

final class Unauthenticated extends AuthState {
  Unauthenticated();

  @override
  List<Object?> get props => throw UnimplementedError();
}

final class AuthError extends AuthState {
  AuthError();

  @override
  List<Object?> get props => throw UnimplementedError();
}
