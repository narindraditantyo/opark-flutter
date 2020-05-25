import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mobile_app/services/auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();

  String nameInput = '';
  String dateInput = DateTime.now().day.toString() + '/' + DateTime.now().month.toString() + '/' + DateTime.now().year.toString();
  String emailInput = '';
  String passInput = '';
  String confirmInput = '';
  final _formKey = GlobalKey<FormState>();

  String errorName = '';
  String errorEmail = '';
  String errorPass = '';
  String errorConfirm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            'Nama Lengkap',
                            style: GoogleFonts.lato(
                              color: Color(0xff121212),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            errorName,
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
                                errorName = ' tidak boleh dikosongi';
                              });
                              return '';
                            } else {
                              setState(() {
                                errorName = '';
                              });
                              return null;
                            }
                          },
                          onChanged: (input) {
                            setState(() {
                              nameInput = input;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'e.g. John Doe'
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Tanggal Lahir',
                        style: GoogleFonts.lato(
                          color: Color(0xff121212),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        )
                      ),
                      SizedBox(height: 8.0),
                      InkWell(
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            currentTime: DateTime.now(),
                            minTime: DateTime(1950, 1, 1),
                            maxTime: DateTime.now(),
                            onConfirm: (date) {
                              setState(() {
                                dateInput = date.day.toString() + '/' + date.month.toString() + '/' + date.year.toString();
                              });
                            },
                            locale: LocaleType.id,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Color(0xffDEDEDE),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              dateInput,
                              style: GoogleFonts.lato(
                                color: Color(0xff121212),
                                fontSize: 16.0,
                              )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
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
                            } else if (!input.contains('@')) {
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
                            hintText: 'e.g. john.doe@email.com'
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
                                errorPass = ' minimal 8 karakter';
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
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'min. 8 characters',
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: <Widget>[
                          Text(
                            'Konfirmasi Password',
                            style: GoogleFonts.lato(
                              color: Color(0xff121212),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            errorConfirm,
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
                            if(input.isEmpty || input != passInput || input.length < 8) {
                              setState(() {
                                errorConfirm = ' tidak sesuai';
                              });
                              return '';
                            } else {
                              setState(() {
                                errorConfirm = '';
                              });
                              return null;
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'min. 8 characters',
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      InkWell(
                        onTap: () async {
                          if(_formKey.currentState.validate()) {
                            dynamic result = await _auth.registerEmailPassword(nameInput, dateInput, emailInput.trim(), passInput);

                            if(result == null) {
                              setState(() {
                                errorEmail = ' sudah terpakai';
                              });
                              print(result);
                            } else {
                              setState(() {
                                errorName = '';
                                errorEmail = '';
                                errorPass = '';
                                errorConfirm = '';
                              });
                              print(result);
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
                              'REGISTER',
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
                                'REGISTER WITH GOOGLE',
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
            )
          ],
        )
      ),
    );
  }
}