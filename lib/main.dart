import 'package:flutter/material.dart';
import 'package:medical_application/screens/welcome_screen.dart';
import 'package:medical_application/screens/login_screen.dart';
import 'package:medical_application/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medical_application/screens/doctors_screen.dart';
import 'package:medical_application/screens/chosen_doctor_page.dart';
import 'package:medical_application/screens/upcoming_appointments.dart';
import 'package:medical_application/screens/application_form.dart';
import 'package:medical_application/screens/session_history.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MedicalApp());
}

class MedicalApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/third': (context) => LoginScreen(),
        '/fourth': (context) => RegistrationScreen(),
        '/fifth': (context) => DoctorScreen(),
        '/sixth': (context) => DoctorPage(),
        '/seventh': (context) => UpcomingAppointments(),
        '/eighth': (context) => ProfileForm(),
        '/tenth': (context) => HomePage(),





      },
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'AmaticSC'),
          bodyText2: TextStyle(color: Colors.black54, fontFamily: 'AmaticSC',),
        ),
      ),

    );
  }
}
