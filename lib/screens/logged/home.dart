import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FireMap(),
      ),
    );
  }
}

class FireMap extends StatefulWidget {
  @override
  _FireMapState createState() => _FireMapState();
}

class _FireMapState extends State<FireMap> {
  GoogleMapController mapController;

  build(context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          initialCameraPosition: null,
          onMapCreated:_onMapCreated,
          myLocationEnabled: true,
          mapType: MapType.satellite,
          trafficEnabled: true,
        )
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}