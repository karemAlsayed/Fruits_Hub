import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';

class FireBaseAuthService {
  Future<User> createUserwithEmailAndPassword({required String email,required String password})async {
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  return credential.user!;
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    throw CustomExeptions(message: 'كلمة المرور قصيرة جدًا.');
  } else if (e.code == 'email-already-in-use') {
    throw CustomExeptions(message: 'البريد الإلكتروني مستخدم مسبقًا.');
  }else{
    throw CustomExeptions(message: 'حدث خطأ ما' );
  }
} catch (e) {
  throw CustomExeptions(message: 'حدث خطأ ما' );
}
  }
}
