import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/screens/logged/home.dart';

class LoginPage extends StatefulWidget {
	@override
	_LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

	String _email, _password;
	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: Form(
				key: _formKey,
				child: Column(
					children: <Widget>[
						TextFormField(
							validator: (input) {
								if(input.isEmpty) {
									return 'Email please';
								}
							},
							onSaved: (input) => _email = input,
							decoration: InputDecoration(
									labelText: 'Email',
							),
						),
						TextFormField(
							validator: (input) {
								if(input.length < 8) {
									return 'Password please';
								}
							},
							onSaved: (input) => _password = input,
							decoration: InputDecoration(
									labelText: 'Password ',
							),
							obscureText: true,
						)
					],
				),
			),
			)
		);
	}

	Future<void> signIn() async {
		final formState = _formKey.currentState;

		if(formState.validate()) {
			formState.save();

			try {
				FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
				Navigator.push(
					context, MaterialPageRoute(
						builder: (context) => HomePage()
					)
				);
			} catch(e) {
				print(e.message); 
			}
		}
	}
}