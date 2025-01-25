part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoadingAuthState extends AuthState {}

final class SuccessAuthState extends AuthState {
  final String message;

  const SuccessAuthState({required this.message});
}

final class ErrorAuthState extends AuthState {
  final String message;

const  ErrorAuthState({required this.message});
}
