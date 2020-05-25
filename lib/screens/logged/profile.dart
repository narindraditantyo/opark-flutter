import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mobile_app/services/auth.dart';

class ProfileComp extends StatefulWidget {
  @override
  _ProfileCompState createState() => _ProfileCompState();
}

class _ProfileCompState extends State<ProfileComp> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  'Profile',
                  style: GoogleFonts.lato(
                    color: Color(0xff121212),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () async {
                await _auth.logOut();
                Navigator.pop(context);
              },
              child: Container(
                height: 48.0,
                decoration: BoxDecoration(
                  color: Color(0xffF5F6F8),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff121212).withOpacity(0.24),
                      blurRadius: 8.0,
                      offset: Offset(4.0, 4.0),
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    'Logout',
                    style: GoogleFonts.lato(
                      color: Color(0xffD32F2F),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                )
              ),
            )
          ],
        )
      ),
    );
  }
}