// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';

class FireBaseAuthService {
  Future<User> createUserwithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FireBaseAuthService.createUserwithEmailAndPassword: ${e.message}');
      // Handle Firebase specific errors
      if (e.code == 'weak-password') {
        throw CustomExeptions(message: 'كلمة المرور قصيرة جدًا.');
      } else if (e.code == 'network-request-failed') {
        throw CustomExeptions(message: 'خطأ في الاتصال بالانترنت.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExeptions(message: 'البريد الإلكتروني مستخدم مسبقًا.');
      } else {
        // Log detailed Firebase error

        throw CustomExeptions(message: 'حدث خطأا ما');
      }
    } catch (e) {
      log('Exception in FireBaseAuthService.createUserwithEmailAndPassword: ${e.toString()}');
      throw CustomExeptions(message: 'حدث خطأ غير متوقع');
    }
  }

  Future<User> signInwithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FireBaseAuthService.createUserwithEmailAndPassword: ${e.message}');
      // Handle Firebase specific errors
      if (e.code == 'weak-password') {
        throw CustomExeptions(message: 'كلمة المرور قصيرة جدًا.');
      } else if (e.code == 'network-request-failed') {
        throw CustomExeptions(message: 'خطأ في الاتصال بالانترنت.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExeptions(message: 'البريد الالكتروني غير مسجل.');
      } else {
        // Log detailed Firebase error

        throw CustomExeptions(message: 'حدث خطأا ما');
      }
    } catch (e) {
      log('Exception in FireBaseAuthService.createUserwithEmailAndPassword: ${e.toString()}');
      throw CustomExeptions(message: 'حدث خطأ غير متوقع');
    }
  }
}
