import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mobile_app/services/auth.dart';

class LoginPage extends StatefulWidget {
	@override
	_LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();

  String emailInput = '';
  String passInput = '';
  final _formKey = GlobalKey<FormState>();

  String errorEmail = '';
  String errorPass = '';

  bool _secureText = true;

  void _togglePass() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
	Widget build(BuildContext context) {
		return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(0.0),
              width: 24.0,
              child: IconButton(
                padding: EdgeInsets.all(0.0),
                icon: Icon(
                  LineAwesomeIcons.close,
                  size: 20.0,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Email',
                            style: GoogleFonts.lato(
                              color: Color(0xff121212),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            errorEmail,
                            style: GoogleFonts.lato(
                              color: Color(0xffD32F2F),
                              fontSize: 16.0,
                            )
                          )
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Color(0xffDEDEDE),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          validator: (input) {
                            if(input.isEmpty) {
                              setState(() {
                                errorEmail = ' tidak boleh dikosongi';
                              });
                              return '';
                            } else if(!input.contains('@')) {
                              setState(() {
                                errorEmail = ' tidak valid';
                              });
                              return '';
                            } else {
                              setState(() {
                                errorEmail = '';
                              });
                              return null;
                            }
                          },
                          onChanged: (input) {
                            setState(() {
                              emailInput = input;
                            });
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'e.g. john.doe@email.com',
                            errorStyle: TextStyle(
                              height: 0,
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: <Widget>[
                          Text(
                            'Password',
                            style: GoogleFonts.lato(
                              color: Color(0xff121212),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            errorPass,
                            style: GoogleFonts.lato(
                              color: Color(0xffD32F2F),
                              fontSize: 16.0,
                            )
                          )
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Color(0xffDEDEDE),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          validator: (input) {
                            if(input.isEmpty) {
                              setState(() {
                                errorPass = ' tidak boleh dikosongi';
                              });
                              return '';
                            } else if(input.length < 8) {
                              setState(() {
                                errorPass = ' kurang dari 8 karakter';
                              });
                              return '';
                            } else {
                              setState(() {
                                errorPass = '';
                              });
                              return null;
                            }
                          },
                          onChanged: (input) {
                            setState(() {
                              passInput = input;
                            });
                          },
                          obscureText: _secureText,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'min. 8 characters',
                            errorStyle: TextStyle(
                              height: 0,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _secureText ? LineAwesomeIcons.eye_slash : LineAwesomeIcons.eye
                              ),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                _togglePass();
                              },
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      InkWell(
                        onTap: () async {
                          if(_formKey.currentState.validate()) {
                            dynamic result = await _auth.loginEmailPassword(emailInput.trim(), passInput);

                            if(result == null) {
                              setState(() {
                                errorEmail = ' mohon dicek kembali';
                                errorPass = ' mohon dicek kembali';
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Color(0xff388E3C),
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff121212).withOpacity(0.24),
                                blurRadius: 8.0,
                                offset: Offset(4.0, 4.0),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: GoogleFonts.lato(
                                color: Color(0xffF5F6F8),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(
                              color: Color(0xffAAAAAA),
                            )
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            'OR',
                            style: GoogleFonts.lato(
                              color: Color(0xffAAAAAA),
                              fontSize: 16.0,
                            )
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Divider(
                              color: Color(0xffAAAAAA),
                            )
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff121212).withOpacity(0.24),
                                blurRadius: 8.0,
                                offset: Offset(4.0, 4.0),
                              )
                            ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/icons/google-logo.png',
                                scale: 24.0,
                              ),
                              SizedBox(width: 16.0),
                              Text(
                                'LOGIN WITH GOOGLE',
                                style: GoogleFonts.lato(
                                  color: Color(0xff121212),
                                  fontSize: 16.0,
                                )
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ),
              )
            ),
          ],
        )
      ),
    );
	}
}