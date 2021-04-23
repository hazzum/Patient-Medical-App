import 'package:medical_application/constants.dart';
import 'package:medical_application/Components/general_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;


  String genderValue = 'MALE';
  String email;
  String password;
  String fullname;
  String phonenumber;

  bool _loadingIndicator = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loadingIndicator,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 15,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 80.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                  onChanged: (value) {
                    fullname = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),

                    hintText: 'Enter your Full Name',
                  ),
                ),

                SizedBox(
                  height: 24.0,
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
                  height: 24.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                  onChanged: (value) {
                    password = value;
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
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                  onChanged: (value) {
                    phonenumber = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),

                    hintText: 'Enter your Phone Number',
                  ),
                ),

                SizedBox(
                  height: 24.0,
                ),

              ],
            ),

            DropdownButton<String>(
              value: genderValue,
              icon: Icon(
                Icons.arrow_downward,
                color: Colors.blueAccent,
              ),
              underline: Container(
                color: Colors.white,
                height: 2,
              ),
              iconSize: 24,
              elevation: 15,
              style: TextStyle(
                color: Colors.grey,
              ),
              onChanged: (String newValue) {
                setState(() {
                  genderValue =  newValue;
                });
              },
              selectedItemBuilder: (BuildContext context) {
                return ['MALE', 'FEMALE'].map((String value) {
                  return Text(
                    genderValue,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                      height: 2.5,
                    ),
                  );
                }).toList();
              },
              items: <String>['MALE', 'FEMALE']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),

              GeneralButton(
                style: TextStyle(color: Colors.white),
                onPressed: ()async {
                  setState(() {
                    _loadingIndicator = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser!=null){
                      Navigator.pushNamed(context, '/third');
                    }
                    setState(() {
                      _loadingIndicator = false;
                    });
                  }
                  catch (e){
                    print (e);
                  }

                },
                label: 'Register' ,
                color: Colors.blueAccent,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
