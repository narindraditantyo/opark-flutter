import 'package:flutter/material.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/screens/unlogged/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);

    return Authenticate();

  }
}