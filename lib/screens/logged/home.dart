// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class HomeComp extends StatefulWidget {
  @override
  _HomeCompState createState() => _HomeCompState();
}

class _HomeCompState extends State<HomeComp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: <Widget>[
            Image.asset(
              'assets/icons/app-logo-transparent.png',
              width: 36.0,
            ),
            SizedBox(width: 8.0),
            Text(
              'oPark',
              style: GoogleFonts.comfortaa(
                color: Color(0xffF5F6F8),
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            )
          ],
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/profilePage');
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              margin: EdgeInsets.only(right: 16.0),
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff121212).withOpacity(0.12),
                    blurRadius: 8.0,
                    offset: Offset(4.0, 4.0),
                  )
                ],
              ),
              child: Image.asset(
                'assets/icons/plain_profile.png'
              ),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffFFA000), Color(0xff388E3C)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28.0),
                    bottomRight: Radius.circular(28.0),
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 72.0),
                    Row(
                      children: <Widget>[
                        Text(
                          'Hai, ',
                          style: GoogleFonts.lato(
                            color: Color(0xffF5F6F8),
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          'Gregorius Agung',
                          style: GoogleFonts.lato(
                            color: Color(0xffF5F6F8),
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Mau pergi kemana hari ini?',
                      style: GoogleFonts.lato(
                        color: Color(0xffF5F6F8),
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 44.0),
                  ],
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 16.0,
                          top: 169.0,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffF5F6F8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff121212).withOpacity(0.24),
                              blurRadius: 8.0,
                              offset: Offset(4.0, 4.0),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/pickLocation');
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                width: 56.0,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xff388E3C),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: Icon(
                                        LineAwesomeIcons.plus,
                                        color: Color(0xffF5F6F8),
                                        size: 24.0,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      'Book',
                                      style: GoogleFonts.lato(
                                        color: Color(0xff121212),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/activityPage');
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                width: 56.0,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xff388E3C),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: Icon(
                                        LineAwesomeIcons.clipboard,
                                        color: Color(0xffF5F6F8),
                                        size: 24.0,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      'Activity',
                                      style: GoogleFonts.lato(
                                        color: Color(0xff121212),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/eventPage');
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                width: 56.0,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xff388E3C),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: Icon(
                                        LineAwesomeIcons.calendar,
                                        color: Color(0xffF5F6F8),
                                        size: 24.0,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      'Event',
                                      style: GoogleFonts.lato(
                                        color: Color(0xff121212),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 169.0,
                          right: 16.0,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff388E3C),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff121212).withOpacity(0.24),
                              blurRadius: 8.0,
                              offset: Offset(4.0, 4.0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              LineAwesomeIcons.qrcode,
                              color: Color(0xffF5F6F8),
                              size: 40.0,
                            ),
                            Text(
                              'Scan',
                              style: GoogleFonts.lato(
                                color: Color(0xffF5F6F8),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
          SizedBox(height: 32.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Latest Promo',
                  style: GoogleFonts.lato(
                    color: Color(0xff121212),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.0),
                // TODO: Carousel slider for 'latest promo' section
              ],
            ),
          ),
        ],
      ),
    );
  }
}