import 'package:chat_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    
  });
  factory UserModel.formFirebase(Map<String,dynamic>document) {
    return UserModel(
        
        phone: document["phone"],
        id: document["id"],
        name: document["name"],
        email: document["email"]);
  }
  
}
