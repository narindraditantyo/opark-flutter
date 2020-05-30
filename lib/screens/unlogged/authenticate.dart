import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 16.0,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/icons/app-logo-splash.png'
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/loginPage');
                          },
                          height: 48.0,
                          color: Color(0xff388E3C),
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Text(
                            'LOGIN',
                            style: GoogleFonts.lato(
                              color: Color(0xfffF5F6F8),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            )
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/registerPage');
                          },
                          height: 48.0,
                          color: Color(0xff388E3C),
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Text(
                            'REGISTER',
                            style: GoogleFonts.lato(
                              color: Color(0xffF5F6F8),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Color(0xffAAAAAA),
                        )
                      ),
                      SizedBox(width: 16.0),
                      Text(
                        'OR',
                        style: GoogleFonts.lato(
                          color: Color(0xffAAAAAA),
                          fontSize: 16.0,
                        )
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Divider(
                          color: Color(0xffAAAAAA),
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  InkWell(
                    onTap: () {

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
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/google-logo.png',
                            scale: 24.0,
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            'CONTINUE WITH GOOGLE',
                            style: GoogleFonts.lato(
                              color: Color(0xff121212),
                              fontSize: 16.0,
                            )
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}