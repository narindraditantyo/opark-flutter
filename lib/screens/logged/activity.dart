import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mobile_app/services/auth.dart';
import 'package:mobile_app/services/database.dart';

class ActivityComp extends StatefulWidget {
  @override
  _ActivityCompState createState() => _ActivityCompState();
}

class _ActivityCompState extends State<ActivityComp> {
  final AuthService _auth = AuthService();
  
  Future<String> _checkAct() async {
    String userUID = await _auth.getCurrentUID();
    String dispName = await DatabaseService(userUID: userUID).checkAct();
    return Future.value(dispName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(0.0),
                      width: 24.0,
                      child: IconButton(
                        padding: EdgeInsets.all(0.0),
                        icon: Icon(
                          LineAwesomeIcons.arrow_left,
                          size: 20.0,
                        ),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'Activities',
                      style: GoogleFonts.lato(
                        color: Color(0xff121212),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/historyPage');
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    'History',
                    style: GoogleFonts.lato(
                      color: Color(0xff388E3C),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 24.0),
            Text(
              'Current Booking',
              style: GoogleFonts.lato(
                color: Color(0xff121212),
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.0),
          ],
        )
      ),
    );
  }
}

class HistoryComp extends StatefulWidget {
  @override
  _HistoryCompState createState() => _HistoryCompState();
}

class _HistoryCompState extends State<HistoryComp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(0.0),
                  width: 24.0,
                  child: IconButton(
                    padding: EdgeInsets.all(0.0),
                    icon: Icon(
                      LineAwesomeIcons.arrow_left,
                      size: 20.0,
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Text(
                  'History',
                  style: GoogleFonts.lato(
                    color: Color(0xff121212),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
            SizedBox(height: 24.0),
            Text(
              'Past Booking',
              style: GoogleFonts.lato(
                color: Color(0xff121212),
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.0),
          ],
        )
      ),
    );
  }
}