import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.fromFireBaseUser(User user) {
    return UserModel(
      name: user.displayName??'no name',
      email: user.email??'no email',
      uId: user.uid,
    );
  }
}
