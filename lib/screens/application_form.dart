import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key key}) : super(key: key);
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('patients');
  final FirebaseAuth auth = FirebaseAuth.instance;

  String uid;

  String getData() {
    final User user = auth.currentUser;
    final String uid = user.uid;
    return uid;
  }

  // here you write the codes to input the data into firestore

  String emergencyName;
  String emergencyNumber;
  String emergencyRelation;

  String userInput;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade800,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15, 25, 15, 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Emergency Contacts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                FormBuilderTextField(
                  onChanged: (value) {
                    emergencyName = value;
                  },
                  name: 'emergency name field',
                  decoration: InputDecoration(
                    hintText: 'Enter the Person\'s name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field Required";
                    }
                    return null;
                  },
                ),
                FormBuilderTextField(
                  onChanged: (value) {
                    emergencyNumber = value;
                  },
                  name: 'emergency number field',
                  decoration: InputDecoration(
                    hintText: 'Enter the person\'s number',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field Required";
                    }
                    return null;
                  },
                ),
                FormBuilderTextField(
                  onChanged: (value) {
                    emergencyRelation = value;
                  },
                  name: 'emergency relation field',
                  decoration: InputDecoration(
                    hintText: 'Enter the person\'s relation',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field Required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Have you suffered from any of the following?",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
                SizedBox(
                  height: 10,
                ),
                CheckboxGroup(
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                  labels: <String>[
                    "Penicillin",
                    "Latex",
                    "Local Anesthetics",
                    "Wednesday",
                    "Aspirin",
                    "Acrylic",
                    "Sulfa drugs",
                    "Codeine",
                    "Metal",
                  ],
                  activeColor: Colors.black54,
                  onChange: (bool isChecked, String label, int index) =>
                      print("isChecked: $isChecked  "
                          " label: $label  index: $index"),
                  onSelected: (List<String> checked) =>
                      print("checked: ${checked.toString()}"),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Are you allergic to any of the following?",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
                SizedBox(
                  height: 10,
                ),
                CheckboxGroup(
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                  labels: <String>[
                    "HIV/AIDS",
                    "Angina",
                    "Asthma",
                    "Cancer",
                    "Heart Disorders",
                    "Alzheimer",
                    "Arthritis/Gout",
                    "Blood Transfusion",
                    "Chemotherapy",
                    "Anaphylaxis",
                    "Artificial heart valve",
                    "Chest Pains",
                    "Cortisone",
                    "Anemia",
                    "Artificial Joint",
                    "Bruise easily",
                    "Diabetes",
                    "Cold sores/Fever blisters"
                  ],
                  activeColor: Colors.black54,
                  onChange: (bool isChecked, String label, int index) =>
                      print("isChecked: $isChecked  "
                          " label: $label  index: $index"),
                  onSelected: (List<String> checked) =>
                      print("checked: ${checked.toString()}"),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "If you are a WOMAN, are you:",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
                SizedBox(
                  height: 10,
                ),
                CheckboxGroup(
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                  labels: <String>[
                    'Pregnant/trying to get?',
                    'Taking Oral contraceptives?',
                    'Nursing?',
                  ],
                  activeColor: Colors.black54,
                  onChange: (bool isChecked, String label, int index) =>
                      print("isChecked: $isChecked  "
                          " label: $label  index: $index"),
                  onSelected: (List<String> checked) =>
                      print("checked: ${checked.toString()}"),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Familial Diseases",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Have you or your blood relatives have had any of the following?",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Check those where the answer is YES",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                SizedBox(
                  height: 10,
                ),
                CheckboxGroup(
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                  labels: <String>[
                    'Heart Attack, age < 50',
                    'Elevated cholesterol',
                    'Congenital heart disease',
                    'Glaucoma',
                    "Strokes, Age <50",
                    "Diabetes",
                    "Heart operations",
                    'High blood pressure',
                    'Asthma/hay fever',
                    "Obesity",
                  ],
                  activeColor: Colors.black54,
                  onChange: (bool isChecked, String label, int index) =>
                      print("isChecked: $isChecked  "
                          " label: $label  index: $index"),
                  onSelected: (List<String> checked) =>
                      print("checked: ${checked.toString()}"),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Smoking and Alcoholic drinks, Do you:",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
                CheckboxGroup(
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                  labels: <String>[
                    "Smoke Cigarettes?",
                    "Drink Alcohol",
                  ],
                  activeColor: Colors.black54,
                  onChange: (bool isChecked, String label, int index) =>
                      print("isChecked: $isChecked  "
                          " label: $label  index: $index"),
                  onSelected: (List<String> checked) =>
                      print("checked: ${checked.toString()}"),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                        showAlertDialog(context);
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget confirmButton = TextButton(
      child: Text("Confirm"),
      onPressed: () {
        uid = getData();

        if (uid != null) {
          users.doc(uid).set({
            'emergency_info': {
              'emergency_name': emergencyName,
              'emergency_number': emergencyNumber,
              'emergency_relation': emergencyRelation,
            }
          }, SetOptions(merge: true)).then((value) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Confirmed')));
            print("User Added");
          }).catchError((error) => print("Failed to add user: $error"));

          Navigator.of(context).pop();
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("IMPORTANT"),
      content: Text("Do you confirm the validity of your answers?"),
      actions: [
        cancelButton,
        confirmButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
