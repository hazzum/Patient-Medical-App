import 'package:medical_application/constants.dart';
import 'package:flutter/material.dart';
import 'package:medical_application/Components/general_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void showMyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Sign In Error"),
          content: new Text("Try another E-mail or Password"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String email;
  String pass;
  final _auth = FirebaseAuth.instance;
  bool _loadingIndicator = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.grey,
      opacity: 0.8,
      inAsyncCall: _loadingIndicator,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 100.0,
                  child: Image.asset('images/imsLogo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[800],
                ),
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintText: 'Enter your Email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[800],
                ),
                onChanged: (value) {
                  pass = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintText: 'Enter your Password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              GeneralButton(
                color: Color(0xFF1DB5E4),
                onPressed: () async {
                  setState(() {
                    _loadingIndicator = true;
                  });
                  try {
                    final signedInUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: pass);
                    if (signedInUser != null) {
                      Navigator.pushNamed(context, '/fifth');
                    }
                    setState(() {
                      _loadingIndicator = false;
                    });
                  } catch (e) {
                    showMyDialog();
                    setState(() {
                      _loadingIndicator = false;
                    });
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            backgroundColor: Color(0xFF1DB5E4),
                            content: new Text('Error in E-mail or Password'),
                            duration: new Duration(seconds: 3),
                          ),
                      );
                  }
                },
                label: 'Log In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
