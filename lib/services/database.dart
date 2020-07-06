import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final String userUID;
  
  DatabaseService({ this.userUID });

  final DatabaseReference dbRef = FirebaseDatabase.instance.reference();

  // Add user data from registration
  addUserData(String fullName, String dispName, String birthDate, String email, String password) {
    dbRef.child('users/$userUID').set({
      'fullName': fullName,
      'dispName': dispName,
      'birthDate': birthDate,
      'email': email,
      'password': password,
    });
  }

  // Get user dispName
  Future<String> getDispName() async {
    DataSnapshot snapshot = await dbRef.child('users/$userUID/dispName').once();
    String dispName = snapshot.value;
    return Future.value(dispName);
  }

  // Get user fullName
  Future<String> getFullName() async {
    DataSnapshot snapshot = await dbRef.child('users/$userUID/fullName').once();
    String fullName = snapshot.value;
    return Future.value(fullName);
  }

  // Add booking
  addBooking(String selectedLoc, String selectedSlot) {
    dbRef.child('users/$userUID/activityList').push().set({
      'location': selectedLoc,
      'slot': selectedSlot,
    });
  }
}