import 'package:flutter/material.dart';
import 'package:mobile_app/services/auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if(input.isEmpty) {
                    return 'Enter an email';
                  } else {
                    return null;
                  }
                },
                onChanged: (input) {
                  setState(() => email = input);
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                obscureText: true,
                validator: (input) {
                  if(input.isEmpty) {
                    return 'Enter a password';
                  } else if(input.length < 8) {
                    return 'Password must be 8 character long';
                  } else {
                    return null;
                  }
                },
                onChanged: (input) {
                  setState(() => password = input);
                },
              ),
              SizedBox(height: 32.0,),
              RaisedButton(
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerEmailPass(email, password);

                    if(result == null) {
                       setState(() => error );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}