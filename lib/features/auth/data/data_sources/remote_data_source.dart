import 'package:chat_app/core/errors/auth/exceptions.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDataSource {
  Future<UserModel> registerNewUser(
      {required String email, required String password});
  Future<UserModel> loginUser(
      {required String email, required String password});
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final FirebaseAuth auth;

  RemoteDataSourceImpl({required this.auth});
  @override
  Future<UserModel> loginUser(
      {required String email, required String password}) async {
    try {
      final response = await auth.signInWithEmailAndPassword(email: email, password: password);
      return UserModel.formFirebase(response.user!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case "email-already-in-use":
            throw RegisteredEmailException();
          case "invalid-email":
            throw InValidEmailException();
          case "weak-password":
            throw WeekPasswordException();
          case "user-disabled":
            throw UserDisabledException();
          case "operation-not-allowed":
            throw EmailPasswordDisbledException();
          case "too-many-requests":
            throw SerrverException();
        }
      }
      throw SerrverException();
    }
  }

  @override
  Future<UserModel> registerNewUser(
      {required String email, required String password})async {
   try {
      final response = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return UserModel.formFirebase(response.user!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case "email-already-in-use":
            throw RegisteredEmailException();
          case "invalid-email":
            throw InValidEmailException();
          case "weak-password":
            throw WeekPasswordException();
          case "user-disabled":
            throw UserDisabledException();
          case "operation-not-allowed":
            throw EmailPasswordDisbledException();
          case "too-many-requests":
            throw SerrverException();
        }
      }
      throw SerrverException();
    }
  }
}
