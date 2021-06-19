import 'package:medical_application/constants.dart';
import 'package:flutter/material.dart';
import 'package:medical_application/Components/general_Button.dart';
import 'package:medical_application/Components/login_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String Email;
  String Password;
  final _auth = FirebaseAuth.instance;
  bool _LoadingIndicator = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(

      color: Colors.grey,
      opacity: 0.8,
      inAsyncCall: _LoadingIndicator,
      child: Scaffold(
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
                  Email = value;
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
                  Password = value;
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
                onPressed: () async{
                  setState(() {
                    _LoadingIndicator= true;
                  });
                  try {
                    final signedInUser = await _auth.signInWithEmailAndPassword(
                        email: Email, password: Password);
                    if (signedInUser!=null){
                      Navigator.pushNamed(context, '/fifth');
                    }
                    setState(() {
                      _LoadingIndicator= false;
                    });
                  }
                  catch (e){
                    print(e);
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
