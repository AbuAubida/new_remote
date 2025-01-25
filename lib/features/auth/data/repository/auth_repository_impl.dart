import 'package:chat_app/core/errors/auth/exceptions.dart';
import 'package:chat_app/core/errors/auth/failure.dart';
import 'package:chat_app/core/network/device_internet_connection.dart';
import 'package:chat_app/features/auth/data/data_sources/remote_data_source.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:chat_app/features/auth/domain/reopository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource remoteDataSource;
  final DeviceInternetConnection connection;

  AuthRepositoryImpl(
      {required this.connection, required this.remoteDataSource});
  @override
  Future<Either<Failure, UserEntity>> loginIn(
      {required String email, required String password}) async {
    if (await connection.getConnection()) {
      try {
        final user = await remoteDataSource.loginUser(
            email: email, password: password);
        return right(user);
      } on SerrverException {
        return left(SerrverFailure());
      } on UserDisabledException {
        return left(UserDisabledFailure());
      } on EmailPasswordDisbledException {
        return left(EmailPasswordDisbledFailure());
      } on InValidEmailException {
        return left(InValidEmailFailure());
      } on WeekPasswordException {
        return left(WeekPasswordFailure());
      } on RegisteredEmailException {
        return left(RegisteredEmailFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> registerNewUser(
      {required String email, required String password}) async {
    if (await connection.getConnection()) {
      try {
        final user = await remoteDataSource.registerNewUser(
            email: email, password: password);
        return right(user);
      } on SerrverException {
        return left(SerrverFailure());
      } on UserDisabledException {
        return left(UserDisabledFailure());
      } on EmailPasswordDisbledException {
        return left(EmailPasswordDisbledFailure());
      } on InValidEmailException {
        return left(InValidEmailFailure());
      } on WeekPasswordException {
        return left(WeekPasswordFailure());
      } on RegisteredEmailException {
        return left(RegisteredEmailFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
