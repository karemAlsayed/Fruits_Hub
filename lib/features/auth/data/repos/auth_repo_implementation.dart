

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo{
  @override
  Future<Either<Failure, UserEntity>> createUserwithEmailAndPassword(String email, String password) {
    
    throw UnimplementedError();
  }
  
}