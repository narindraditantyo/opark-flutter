import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SpinKitFadingCircle(
          color: Color(0xffDEDEDE),
          size: 48.0,
        ),
      ),
    );
  }
}