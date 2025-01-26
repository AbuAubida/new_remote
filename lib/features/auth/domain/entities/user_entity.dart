import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String id;
  final String email;
  final String phone;
  
  const UserEntity(  
      {
      required  this.id,
        required this.phone,
      
      required this.name,
      required this.email});

  @override
  List<Object?> get props => [name, email, phone];
}
