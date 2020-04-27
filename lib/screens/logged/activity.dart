import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffF5F6F8),
        body: Column(
          children: <Widget>[
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Activity',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Color(0xff121212),
                    fontSize: 36.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ListView(
              padding: EdgeInsets.symmetric(vertical: 16.0),

            ),
          ],
        ),
      )
    );
  }
}