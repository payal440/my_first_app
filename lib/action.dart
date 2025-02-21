import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance; // ✅ Firebase Auth Instance

  // ✅ Email/Password Login Method
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }

  // ✅ Logout Method
  Future<void> logout() async {
    await _auth.signOut();
  }

  // ✅ Check if User is Logged In
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
