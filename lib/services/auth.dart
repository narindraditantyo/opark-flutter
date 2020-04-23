import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Authentication change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // Login with email and password

  // Register with email and password
  Future registerEmailPass(String inputEmail, String inputPass) async {
    try {
      AuthResult result =  await _auth.createUserWithEmailAndPassword(email: inputEmail, password: inputPass);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  
}