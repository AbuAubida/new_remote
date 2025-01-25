import 'package:chat_app/core/errors/auth/failure.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:chat_app/features/auth/domain/reopository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  final AuthRepository authRepo;

 LoginUsecase({required this.authRepo});
  Future<Either<Failure, UserEntity>> call(
          {required String email, required String password}) =>
      authRepo.loginIn(email: email, password: password);
}
