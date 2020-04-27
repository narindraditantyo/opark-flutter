import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeComp(),
      // routes: {
      //   '/activityPage'
      // },
    );
  }
}

class HomeComp extends StatefulWidget {
  @override
  _HomeCompState createState() => _HomeCompState();
}

class _HomeCompState extends State<HomeComp> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(-7.24917, 112.75083),
              zoom: 12,
            ),
            myLocationEnabled: true,
            zoomControlsEnabled: false,
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: RaisedButton(
                    onPressed: () {

                    },
                    color: Color(0xffF5F6F8),
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 32.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 64.0,
                          height: 64.0,
                          child: Container(
                            color: Color(0xffAAAAAA),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                  'Gregorius Agung',
                                  style: GoogleFonts.nunitoSans(
                                    color: Color(0xff121212),
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              FlatButton(
                                onPressed: () {

                                },
                                color: Color(0xffAAAAAA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                                ),
                                child: Text('Data Not Available'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          child: RaisedButton(
                            onPressed: () {

                            },
                            color: Color(0xff388E3C),
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                            ),
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  LineAwesomeIcons.car,
                                  color: Color(0xffF5F6F8),
                                  size: 48.0,
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Book',
                                  style: GoogleFonts.nunitoSans(
                                    color: Color(0xffF5F6F8),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: SizedBox(
                          child: RaisedButton(
                            onPressed: () {
                              
                            },
                            color: Color(0xff388E3C),
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                            ),
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  LineAwesomeIcons.clipboard,
                                  color: Color(0xffF5F6F8),
                                  size: 48.0,
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Activities',
                                  style: GoogleFonts.nunitoSans(
                                    color: Color(0xffF5F6F8),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: SizedBox(
                          child: RaisedButton(
                            onPressed: () {
                              
                            },
                            color: Color(0xff388E3C),
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                            ),
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  LineAwesomeIcons.calendar,
                                  color: Color(0xffF5F6F8),
                                  size: 48.0,
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Events',
                                  style: GoogleFonts.nunitoSans(
                                    color: Color(0xffF5F6F8),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}