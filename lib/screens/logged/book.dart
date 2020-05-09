import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
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
                  color: Color(0xffDEDEDE),
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
                'Lokasi terdekat',
                style: GoogleFonts.lato(
                  color: Color(0xff121212),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.0),
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
                    children: <Widget>[
                      Image.asset(
                        'assets/logo/centre-park.jpg',
                        width: 64.0,
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '150m dari lokasi Anda',
                            style: GoogleFonts.lato(
                              color: Color(0xffAAAAAA),
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Central Park Mall',
                            style: GoogleFonts.lato(
                              color: Color(0xff121212),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Centre Park',
                            style: GoogleFonts.lato(
                              color: Color(0xff121212),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            )
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.0),
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
                          Text(
                            'Secure Parking',
                            style: GoogleFonts.lato(
                              color: Color(0xff121212),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            )
                          )
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
  @override
  _ParkingCompState createState() => _ParkingCompState();
}

class _ParkingCompState extends State<ParkingComp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}