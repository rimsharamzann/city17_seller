part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {
  AuthLoading({
    this.google = false,
    this.email = false,
  });

  final bool google;
  final bool email;
}

final class AuthSuccess extends AuthState {
  AuthSuccess({required this.authResponse});
  final AuthResponse authResponse;
}

final class AuthError extends AuthState {
  AuthError({required this.message});
  final String message;
}
