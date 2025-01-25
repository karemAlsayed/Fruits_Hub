import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final FireBaseAuthService firebaseAuthService;
  final DarabaseService darabaseService;

  AuthRepoImplementation(
      {required this.darabaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserwithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
       user = await firebaseAuthService.createUserwithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);

      await addUserData(user: userEntity);

      return Right(userEntity);
    } on CustomExeptions catch (e) {
       await deleteUser(user);
      return Left((ServerFailure(e.message)));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImplementation.createUserwithEmailAndPassword: ${e.toString()}');
      return Left((ServerFailure('خطأ في تسجيل الدخول')));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInwithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInwithEmailAndPassword(
          email: email, password: password);
      var userEntity =  await getUserData(uid: user.uid);    
      return Right(userEntity);
    } on CustomExeptions catch (e) {
      return Left((ServerFailure(e.message)));
    } catch (e) {
      log('Exception in AuthRepoImplementation.signInwithEmailAndPassword: ${e.toString()}');
      return Left((ServerFailure('خطأ في تسجيل الدخول')));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {

      

       user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFireBaseUser(user);
      await addUserData(user: userEntity);
      var isUserExist = await darabaseService.checkIfDataExists( path: BackendEndpoints.isUserExists,documentId: user.uid);
      if(!isUserExist){
        await addUserData(user: userEntity);
      }else{
        await getUserData(uid: user.uid);
      }

      return Right(userEntity);
    } on CustomExeptions catch (e) {
      await deleteUser(user);
      return Left((ServerFailure(e.message)));
    } catch (e) {
      log('Exception in AuthRepoImplementation.signInWithGoogle: ${e.toString()}');
      return Left((ServerFailure('خطأ في تسجيل الدخول')));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
       user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFireBaseUser(user);
      await addUserData(user: userEntity);
            var isUserExist = await darabaseService.checkIfDataExists( path: BackendEndpoints.isUserExists,documentId: user.uid);
      if(!isUserExist){
        await addUserData(user: userEntity);
      }else{
        await getUserData(uid: user.uid);
      }

      return Right(userEntity);
    
    } on CustomExeptions catch (e) {
      await deleteUser(user);
      return Left((ServerFailure(e.message)));
    } catch (e) {
      log('Exception in AuthRepoImplementation.signInWithFacebook: ${e.toString()}');
      return Left((ServerFailure('خطأ في تسجيل الدخول')));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await darabaseService.addData(
        path: BackendEndpoints.addUserData, data: user.toMap(),
        documentId: user.uId);
  }
  
  @override
  Future<UserEntity> getUserData({required String uid}) async{
    var userData = await darabaseService.getData(path: BackendEndpoints.getUserData, documentId: uid);
    return UserModel.fromJson(userData);
  }
}
