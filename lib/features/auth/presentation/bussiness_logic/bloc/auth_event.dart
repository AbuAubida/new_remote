part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class RegitsterUserEvent extends AuthEvent {
  final String name;
  final String email;

  final String phone;
  final String password;

  const RegitsterUserEvent(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password});
  @override
  List<Object> get props => [email, password, phone, name];
}

final class LoginUserEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginUserEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}
