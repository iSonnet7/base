import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final _auth = FirebaseAuth.instance;

  Future<User?> singIn(String email, String password) async {
    User? user;
    try {
      user = (await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim()))
          .user;
    }catch(e) {
      print(e.toString());
    }
    return user;
  }

  Future<UserCredential> register(String email, String password) async {
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> singOut() async {
    await _auth.signOut();
  }
}