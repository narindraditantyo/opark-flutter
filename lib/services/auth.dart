import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(userUID: user.uid) : null;
  }

  // Change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  // Get userUID
  Future<String> getCurrentUID() async {
    try {
      FirebaseUser user = await _auth.currentUser();
      return Future.value(user.uid);
    } catch(e) {
      print(e.toString());
      return null;
    }
    
  }

  // Login with email and password
  Future loginEmailPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future registerEmailPassword(String fullName, String dispName, String birthDate, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // Create a new document for the user with the userUID
      await DatabaseService(userUID: user.uid).addUserData(fullName, dispName, birthDate, email, password);

      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Continue with Google
  

  // Logout
  Future logOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}