import 'package:flutter/material.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/screens/logged/home.dart';
import 'package:mobile_app/screens/wrapper.dart';
import 'package:mobile_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //   ),
    // );

    // return StreamProvider<User>.value(
    //   value: AuthService().user,
    //   child: MaterialApp(
    //     home: Wrapper(),
    //   ),
    // );

    return MaterialApp(
      home: HomePage(),
    );
  }
}