import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  final String? userPhoto;
  final String? userPhoneNumber;

  const UserModel(
      {required this.userPhoto,
      required this.userPhoneNumber,
      required super.id,
      required super.name,
      required super.email});
  factory UserModel.formFirebase(User user) {
    return UserModel(
        userPhoto: user.photoURL,
        userPhoneNumber: user.phoneNumber,
        id: user.uid,
        name: user.displayName,
        email: user.email);
  }
}
