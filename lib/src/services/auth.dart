import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  // FirebaseAuth.instance. gives us all the functions inside firebase_auth package

  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;
  final _auth = FirebaseAuth.instance;


  Future<void> emailLogin(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    // FirebaseAuth.instance or _auth are same thing, dont get confuse 😤
  }
  
  Future<void> registerUser(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // all other authentication methods like google, facebook, anonymous login will be in this file
}