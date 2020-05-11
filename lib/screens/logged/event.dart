import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class EventComp extends StatefulWidget {
  @override
  _EventCompState createState() => _EventCompState();
}

class _EventCompState extends State<EventComp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
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
                  'Events',
                  style: GoogleFonts.lato(
                    color: Color(0xff121212),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Lagi nggak ada event nih, cek lagi besok ya!',
                  style: GoogleFonts.lato(
                    color: Color(0xffAAAAAA),
                    fontSize: 14.0
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}