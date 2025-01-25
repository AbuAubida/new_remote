import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/auth/failure.dart';

 abstract class AuthRepository   {
 Future<Either<Failure,UserEntity>> registerNewUser({required String email,required String password});
 Future<Either<Failure, UserEntity>>  loginIn(
      {required String email, required String password});
 
}
