import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mobile_app/services/auth.dart';
import 'package:mobile_app/services/database.dart';

class ProfileComp extends StatefulWidget {
  @override
  _ProfileCompState createState() => _ProfileCompState();
}

class _ProfileCompState extends State<ProfileComp> {
  final AuthService _auth = AuthService();

  Future<String> _getFullName() async {
    String userUID = await _auth.getCurrentUID();
    String fullName = await DatabaseService(userUID: userUID).getFullName();
    return Future.value(fullName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  'Profile',
                  style: GoogleFonts.lato(
                    color: Color(0xff121212),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/icons/plain_profile.png',
                    scale: 0.36,
                  ),
                  SizedBox(width: 24.0),
                  Expanded(
                    child: FutureBuilder<String>(
                      future: _getFullName(),
                      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                        if(snapshot.hasData) {
                          return AutoSizeText(
                            '${snapshot.data}',
                            style: GoogleFonts.lato(
                              color: Color(0xff121212),
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            minFontSize: 20.0,
                            overflow: TextOverflow.ellipsis,
                          );
                        } else {
                          return Text('');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.0),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F6F8),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff121212).withOpacity(0.24),
                            blurRadius: 8.0,
                            offset: Offset(4.0, 4.0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            LineAwesomeIcons.edit,
                            size: 24.0,
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            'Edit Profile',
                            style: GoogleFonts.lato(
                              color: Color(0xff121212),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F6F8),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff121212).withOpacity(0.24),
                            blurRadius: 8.0,
                            offset: Offset(4.0, 4.0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            LineAwesomeIcons.credit_card,
                            size: 24.0,
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            'Payment Methods',
                            style: GoogleFonts.lato(
                              color: Color(0xff121212),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  InkWell(
                    onTap: () async {
                      await _auth.logOut();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Color(0xffD32F2F),
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
                          'LOGOUT',
                          style: GoogleFonts.lato(
                            color: Color(0xffF5F6F8),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                      )
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
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
                  'Profile',
                  style: GoogleFonts.lato(
                    color: Color(0xff121212),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                
              ],
            )
          ],
        ),
      ),
    );
  }
}