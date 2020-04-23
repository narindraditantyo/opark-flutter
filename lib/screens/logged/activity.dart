import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ActivityComp(),
    );
  }
}

class ActivityComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      appBar: new AppBar(
        backgroundColor: Color(0xffF5F6F8),
        title: Text(
          'Activities',
          style: TextStyle(
            color: Color(0xff121212),
          ),
        ),
      ),
    );
  }
}