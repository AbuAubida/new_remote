import 'package:chat_app/core/errors/auth/failure.dart';
import 'package:chat_app/features/auth/domain/reopository/auth_repository.dart';
import 'package:dartz/dartz.dart';


class RegisterNewUserUsecase {
  final AuthRepository authRepo;

  RegisterNewUserUsecase({required this.authRepo});
  Future<Either<Failure, Unit>> call(
          {required String name, required String email,required String phone, required String password}) =>
      authRepo.registerNewUser(email: email, password: password,name:name,phone: phone );
}
