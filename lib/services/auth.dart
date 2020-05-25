import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  Future registerEmailPassword(String name, String birthDate, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // Create a new document for the user with the userUID
      await DatabaseService(userUID: user.uid).addUserData(name, birthDate, email, password);

      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Login with Google
  Future loginGoogle() async {
    try {
      
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount googleAccount = await googleSignIn.signIn();

      if(googleAccount == null) {
        return null;
      }

      AuthResult result = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(idToken: (await googleAccount.authentication).idToken, accessToken: (await googleAccount.authentication).accessToken)
      )

      if(result.user == null) {
        return null;
      }

      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

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