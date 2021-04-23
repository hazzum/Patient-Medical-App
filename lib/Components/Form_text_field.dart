import 'package:flutter/material.dart';
import 'package:medical_application/constants.dart';


class FormField extends StatelessWidget {
  FormField({@required this.label, this.obsecureText=false });
  String label;
  var userInput;
  bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: TextInputType.name,
        obscureText: false,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[800],
        ),
        onChanged: (value) {
          userInput = value;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: label,
        )
    );
  }
}