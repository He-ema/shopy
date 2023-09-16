part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthFailure extends AuthState {
  final String errorMessage;
  final String erroHeader;

  AuthFailure({required this.erroHeader, required this.errorMessage});
}

final class AuthSuccess extends AuthState {}
