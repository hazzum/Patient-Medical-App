import 'package:flutter/material.dart';
import 'package:medical_application/constants.dart';


class Text_Field extends StatelessWidget {
  Text_Field({@required this.label, @required this.userInput, this.obsecureText=false });
  String label;
  var userInput;
  bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      obscureText: obsecureText,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey[800],
      ),
      onChanged: (value) {
        userInput = value;
      },
      decoration: kTextFieldDecoration.copyWith(
        hintStyle: TextStyle(
          color: Colors.grey,
        ),

        hintText: label,
      ),
    );
  }
}