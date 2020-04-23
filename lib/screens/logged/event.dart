import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EventComp(),
    );
  }
}

class EventComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      appBar: new AppBar(
        backgroundColor: Color(0xffF5F6F8),
        title: Text(
          'Events',
          style: TextStyle(
            color: Color(0xff121212),
          ),
        ),
      ),
    );
  }
}