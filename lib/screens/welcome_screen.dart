import 'package:flutter/material.dart';
import 'package:medical_application/Components/general_Button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(
        seconds: 2,
      ),
      vsync: this,
    );

    animation = ColorTween(
      begin: Color(0xFF1DB5E4),
      end: Colors.white,
    ).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 200.0,
                  ),
                ),
                Text(
                  'Doctor Who?',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80.0,
            ),
            GeneralButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              label: 'Log In',),
            GeneralButton(
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, '/fourth');
              },
              label: 'Register',),

          ],
        ),
      ),
    );
  }
}


