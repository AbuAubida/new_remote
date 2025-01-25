import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String id;
  final String? email;
  const UserEntity({required this.id,required this.name ,required this.email});
  
  @override
  // TODO: implement props
  List<Object?> get props => [name,id,email];
}
