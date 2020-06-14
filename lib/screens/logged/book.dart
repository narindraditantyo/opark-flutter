import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mobile_app/services/auth.dart';
import 'package:mobile_app/services/database.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LocationComp extends StatefulWidget {
  @override
  _LocationCompState createState() => _LocationCompState();
}

class _LocationCompState extends State<LocationComp> {
  GoogleMapController mapController;
  
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 160.0,
        color: Color(0xffF5F6F8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        backdropEnabled: true,
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(-7.24917, 112.75083),
            zoom: 12,
          ),
          myLocationEnabled: true,
          zoomControlsEnabled: false,
        ),
        panel: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  width: 60.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Color(0xffAAAAAA),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Mau pergi kemana hari ini?',
                style: GoogleFonts.lato(
                  color: Color(0xff121212),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xffDEDEDE).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      LineAwesomeIcons.search,
                      size: 20.0,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'Cari lokasi tujuan Anda...',
                      style: GoogleFonts.lato(
                        color: Color(0xffAAAAAA),
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.0),
              Text(
                'Daftar lokasi',
                style: GoogleFonts.lato(
                  color: Color(0xff121212),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.0),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => ParkingComp(selectedLoc: 'Grand City Surabaya')
                  ));
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
                    children: <Widget>[
                      Image.asset(
                        'assets/logo/secure-parking.jpg',
                        width: 64.0,
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '15km dari lokasi Anda',
                            style: GoogleFonts.lato(
                              color: Color(0xffAAAAAA),
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Grand City Surabaya',
                            style: GoogleFonts.lato(
                              color: Color(0xff121212),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}

class ParkingComp extends StatefulWidget {
  final String selectedLoc;

  ParkingComp({ this.selectedLoc });

  @override
  _ParkingCompState createState() => _ParkingCompState();
}

class _ParkingCompState extends State<ParkingComp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            LineAwesomeIcons.close,
            color: Color(0xff121212),
            size: 20.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 16.0,
          bottom: 16.0,
          right: 16.0,
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.selectedLoc,
                style: GoogleFonts.lato(
                  color: Color(0xff121212),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Pilih lokasi parkir Anda',
                style: GoogleFonts.lato(
                  color: Color(0xff121212),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                )
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Divider(
                            color: Color(0xff121212),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) => SummaryComp(selectedLoc: 'Grand City Surabaya', selectedSlot: 'A01')
                              ));
                            },
                            child: Container(
                              height: 48.0,
                              width: 128.0,
                              color: Color(0xffDEDEDE),
                              child: Center(
                                child: Text(
                                  'A01'
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 32.0),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) => SummaryComp(selectedLoc: 'Grand City Surabaya', selectedSlot: 'B01')
                              ));
                            },
                            child: Container(
                              height: 48.0,
                              width: 128.0,
                              color: Color(0xffDEDEDE),
                              child: Center(
                                child: Text(
                                  'B01'
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xff121212),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Divider(
                            color: Color(0xff121212),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) => SummaryComp(selectedLoc: 'Grand City Surabaya', selectedSlot: 'A02')
                              ));
                            },
                            child: Container(
                              height: 48.0,
                              width: 128.0,
                              color: Color(0xffDEDEDE),
                              child: Center(
                                child: Text(
                                  'A02'
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 32.0),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) => SummaryComp(selectedLoc: 'Grand City Surabaya', selectedSlot: 'B02')
                              ));
                            },
                            child: Container(
                              height: 48.0,
                              width: 128.0,
                              color: Color(0xffDEDEDE),
                              child: Center(
                                child: Text(
                                  'B02'
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xff121212),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Divider(
                            color: Color(0xff121212),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) => SummaryComp(selectedLoc: 'Grand City Surabaya', selectedSlot: 'A03')
                              ));
                            },
                            child: Container(
                              height: 48.0,
                              width: 128.0,
                              color: Color(0xffDEDEDE),
                              child: Center(
                                child: Text(
                                  'A03'
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 32.0),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) => SummaryComp(selectedLoc: 'Grand City Surabaya', selectedSlot: 'B03')
                              ));
                            },
                            child: Container(
                              height: 48.0,
                              width: 128.0,
                              color: Color(0xffDEDEDE),
                              child: Center(
                                child: Text(
                                  'B03'
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xff121212),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

class SummaryComp extends StatelessWidget {
  final AuthService _auth = AuthService();

  final String selectedLoc;
  final String selectedSlot;

  SummaryComp({ this.selectedLoc, this.selectedSlot });

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
                  'Detail booking Anda',
                  style: GoogleFonts.lato(
                    color: Color(0xff121212),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF5F6F8),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff121212).withOpacity(0.24),
                      blurRadius: 8.0,
                      offset: Offset(4.0, 4.0)
                    ),
                  ],
                ),
                child: ListView(
                  children: <Widget>[
                    Text(
                      selectedLoc,
                      style: GoogleFonts.lato(
                        color: Color(0xff121212),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Divider(
                      color: Color(0xffAAAAAA),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Selected slot:',
                      style: GoogleFonts.lato(
                        color: Color(0xff121212),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color(0xffAAAAAA),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          selectedSlot,
                          style: GoogleFonts.lato(
                            color: Color(0xffF5F6F8),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Divider(
                      color: Color(0xffAAAAAA),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Your vehicle:',
                      style: GoogleFonts.lato(
                        color: Color(0xff121212),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color(0xffF5F6F8),
                        border: Border.all(
                          color: Color(0xffDEDEDE),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
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
                                'Toyota Calya',
                                style: GoogleFonts.lato(
                                  color: Color(0xff121212),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 8.0,
                                ),
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
                    SizedBox(height: 4.0),
                    Divider(
                      color: Color(0xffAAAAAA),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Total payment:',
                      style: GoogleFonts.lato(
                        color: Color(0xff121212),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Rp. 25.000,-',
                      style: GoogleFonts.lato(
                        color: Color(0xff121212),
                        fontSize: 24.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Divider(
                      color: Color(0xffAAAAAA),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Payment method:',
                      style: GoogleFonts.lato(
                        color: Color(0xff121212),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 32.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff4D2A86),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'OVO',
                            style: GoogleFonts.lato(
                              color: Color(0xffF5F6F8),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            'Rp. 75.690',
                            style: GoogleFonts.lato(
                              color: Color(0xffF5F6F8),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            RaisedButton(
              onPressed: () async {
                String userUID = await _auth.getCurrentUID();
                await DatabaseService(userUID: userUID).addBooking(selectedLoc, selectedSlot);
                Navigator.pushNamed(context, '/confirmBook');
              },
              padding: EdgeInsets.all(16.0),
              color: Color(0xff388E3C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Confirm Booking',
                style: GoogleFonts.lato(
                  color: Color(0xffF5F6F8),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff88D287), Color(0xff388E3C)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                LineAwesomeIcons.check_circle,
                color: Color(0xffF5F6F8),
                size: 148.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'Booking Berhasil!',
                style: GoogleFonts.lato(
                  color: Color(0xffF5F6F8),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
  }
}
