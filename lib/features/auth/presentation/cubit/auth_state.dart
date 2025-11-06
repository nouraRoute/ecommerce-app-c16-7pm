part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginFailureState extends AuthState {
  final Failure failure;

  LoginFailureState({required this.failure});
}

final class SignupSuccessState extends AuthState {}

final class SignupLoadingState extends AuthState {}

final class SignupFailureState extends AuthState {
  final Failure failure;

  SignupFailureState({required this.failure});
}

final class CheckIsLoggedState extends AuthState {
  final bool isLogged;

  CheckIsLoggedState({required this.isLogged});
}
