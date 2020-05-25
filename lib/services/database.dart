import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final String userUID;
  
  DatabaseService({ this.userUID });

  // final CollectionReference userCollection = Firestore.instance.collection('user');
  
  // Future updateUserData(String name, String birthDate, String email, String password) async {
  //   return await userCollection.document(userUID).setData({
  //     'name': name,
  //     'birthDate': birthDate,
  //     'email': email,
  //     'password': password,
  //   });
  // }

  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  addUserData(String name, String birthDate, String email, String password) {
    databaseReference.child('users').child(userUID).set({
      'name': name,
      'birthDate': birthDate,
      'email': email,
      'password': password,
    });
  }
}