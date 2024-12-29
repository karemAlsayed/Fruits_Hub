import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final FireBaseAuthService firebaseAuthService;

  AuthRepoImplementation({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserwithEmailAndPassword(
      String email, String password, String name) async {
    try {
  var user = await firebaseAuthService.createUserwithEmailAndPassword(
      email: email, password: password);
  
  return Right(UserModel.fromFireBaseUser(user));
} on CustomExeptions catch (e) {
  return Left((ServerFailure(e.message)));
}catch (e) {
  return Left((ServerFailure('خطأ في تسجيل الدخول' )));
}
    
  }
}
