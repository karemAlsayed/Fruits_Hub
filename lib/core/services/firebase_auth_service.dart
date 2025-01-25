// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthService {
  Future deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } catch (e) {
      log('Exception in FireBaseAuthService.deleteUser: ${e.toString()}');
      throw CustomExeptions(message: 'حدث خطأا ما');
    }
  }
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

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      return  (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
      } else {
        throw CustomExeptions(message: 'حدث خطأا ما');
      }
    } catch (e) {
      log('Exception in FireBaseAuthService.signInWithGoogle: ${e.toString()}');
      throw CustomExeptions(message: 'حدث خطأ غير متوقع');
    }
  }
  Future<User> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result. accessToken!.tokenString);
        return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
      } else {
        throw CustomExeptions(message: 'حدث خطأا ما');
      }
    } catch (e) {
      log('Exception in FireBaseAuthService.signInWithFacebook: ${e.toString()}');
      throw CustomExeptions(message: 'حدث خطأ غير متوقع');
    }
  }




}
