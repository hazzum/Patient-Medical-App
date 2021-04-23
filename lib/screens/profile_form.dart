import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:medical_application/Components/Form_text_field.dart';

class ProfileForm extends StatelessWidget {
  String userInput;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black54,
          body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    name: 'name field',
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
                      hintText: 'Enter Full name',
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "Name Required";
                      }
                      return null;
                    },

                  )
                ],),
            ),
        ),
    ),
    );
  }
}
