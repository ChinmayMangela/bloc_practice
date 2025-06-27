import 'package:bloc_practice/authentication/domain/use_cases/user_sign_up.dart';
import 'package:bloc_practice/authentication/presentation/bloc/auth_event.dart';
import 'package:bloc_practice/authentication/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/user_sign_in.dart';
import '../../domain/use_cases/user_sign_out.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final UserSignOut _userSignOut;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required UserSignOut userSignOut,
  }) : _userSignUp = userSignUp,
       _userSignIn = userSignIn,
       _userSignOut = userSignOut,
       super(AuthInitial()) {
    on<AuthSignUpRequested>(_onAuthSignUp);
    on<AuthSignInRequested>(_onAuthSignIn);
    on<AuthSignOutRequested>(_onAuthSignOut);
  }

  Future<void> _onAuthSignUp(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _userSignUp(
      UserSignUpParameter(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> _onAuthSignIn(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _userSignIn(
      UserSignInParameters(email: event.email, password: event.password),
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> _onAuthSignOut(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _userSignOut(NoParameters());
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(AuthSignedOut()),
    );
  }
}
