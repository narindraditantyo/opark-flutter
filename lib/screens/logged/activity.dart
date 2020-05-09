import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ActivityComp extends StatefulWidget {
  @override
  _ActivityCompState createState() => _ActivityCompState();
}

class _ActivityCompState extends State<ActivityComp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(0.0),
                      width: 24.0,
                      child: IconButton(
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
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    
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
              'Current Activities',
              style: GoogleFonts.lato(
                color: Color(0xff121212),
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/transportation/car.png',
                      scale: 3,
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Today, 13:40',
                          style: GoogleFonts.lato(
                            color: Color(0xffAAAAAA),
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Tunjungan Plaza Surabaya',
                          style: GoogleFonts.lato(
                            color: Color(0xff121212),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Color(0xff121212),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            'L 1234 XY',
                            style: GoogleFonts.lato(
                              color: Color(0xffF5F6F8),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
      
    );
  }
}