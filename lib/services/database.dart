// import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Get user data
  Future<String> getDispName() async {
    DataSnapshot snapshot = await dbRef.child('users/$userUID/dispName').once();
    String dispName = snapshot.value;
    return Future.value(dispName);

    // dbRef.child('users/$userUID/dispName').once().then((DataSnapshot snapshot) {
    //   dispName = snapshot.value;
    //   return dispName;
    // });

    // print(dispName);
    // return dispName;

    // StreamBuilder<Event> (
    //   stream: dbRef.child('users/$userUID').onValue,
    //   builder: (context, event) {
    //     Map<dynamic, dynamic> data = event.data.snapshot.value;
    //     data.values.toList()[index]['dispName'];
    //   },
    // );
  }

  // Update user data


  // 
}