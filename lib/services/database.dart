// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mobile_app/models/location.dart';

class DatabaseService {
  final String userUID;
  
  DatabaseService({ this.userUID });

  List<Location> listItems = [];

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

  // // Add payment method for each user
  // addPayMethod() {
  //   dbRef.child('users/$userUID/payWallet').push().set({
  //     ''
  //   })
  // }

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

  // Update user data


  // // Get location data
  // Future<List<Location>> getLocation() async {
  //   dbRef.child('locations').once().then((DataSnapshot snapshot) {
  //     Map<dynamic, dynamic> locationList = snapshot.value;
  //     locationList.forEach((key, value) {

  //     })
  //   });
  // }

  // Check activity existence
  Future checkAct() async {
    DataSnapshot snapshot = await dbRef.child('users/$userUID/activityList').once();
    return snapshot.value;
  }

  // Add booking
  addBooking(String selectedLoc, String selectedSlot) {
    dbRef.child('users/$userUID/activityList').push().set({
      'location': selectedLoc,
      'slot': selectedSlot,
    });
  }
}