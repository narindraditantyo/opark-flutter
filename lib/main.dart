import 'package:flutter/material.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/screens/logged/activity.dart';
import 'package:mobile_app/screens/logged/book.dart';
import 'package:mobile_app/screens/logged/event.dart';
import 'package:mobile_app/screens/logged/home.dart';
import 'package:mobile_app/screens/logged/payment.dart';
import 'package:mobile_app/screens/logged/profile.dart';
import 'package:mobile_app/screens/unlogged/login.dart';
import 'package:mobile_app/screens/unlogged/register.dart';
import 'package:mobile_app/screens/wrapper.dart';
import 'package:mobile_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: {
          '/loginPage': (context) => LoginPage(),
          '/registerPage': (context) => RegisterPage(),
          '/homePage': (context) => HomeComp(),
          '/pickLocation': (context) => LocationComp(),
          '/chooseSlot': (context) => ParkingComp(),
          '/bookSummary': (context) => SummaryComp(),
          '/confirmBook': (context) => Confirmation(),
          '/activityPage': (context) => ActivityComp(),
          '/historyPage': (context) => HistoryComp(),
          '/eventPage': (context) => EventComp(),
          '/paymentPage': (context) => PaymentComp(),
          '/profilePage': (context) => ProfileComp(),
        },
      ),
    );
  }
}