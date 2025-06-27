import 'package:bloc_practice/authentication/domain/entities/user.dart';
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

final class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}

final class AuthSignedOut extends AuthState {
  AuthSignedOut();

  @override
  List<Object?> get props => [];
}
