import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final firebase = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    final user = await firebase.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
  }

  Future<void> signup(String email, String name, String password) async {
    final user = await firebase.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
  }

  Future<void> resetPassword(String email) async {
    await firebase.sendPasswordResetEmail(email: email.trim());
  }
}