import 'package:chat_app/core/errors/auth/exceptions.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDataSource {
  Future<Unit> registerNewUser(
      {required String name,
      required String phone,
      required String email,
      required String password});
  Future<UserModel> loginUser(
      {required String email, required String password});
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firesotre;

  RemoteDataSourceImpl(this.firesotre, {required this.auth});
  @override
  Future<UserModel> loginUser(
      {required String email, required String password}) async {
    try {
      final response = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user =
          await firesotre.collection("users").doc(response.user!.uid).get();
      user.data();
      return UserModel.formFirebase(user.data()!);
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
          case "wrong-password":
            throw WrongPasswordException();
          case "user-not-found":
            throw UnRegisteredUserException();
          case "invalid-credential":
            throw InValidCredentialException();
        }
      }
      throw UnHandledException();
    }
  }

  @override
  Future<Unit> registerNewUser(
      {required String name,
      required String phone,
      required String email,
      required String password}) async {
    try {
      final response = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await firesotre.collection("users").doc(response.user!.uid).set({
        "id": response.user!.uid,
        "name": name,
        "email": email,
        "phone": phone,
      });
      return unit;
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
      } else if (e is FirebaseException) {
        print(e.message);
      }
      throw SerrverException();
    }
  }
}
