import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {

  final Color color;
  final Function onPressed;
  final String label;
  final TextStyle style;
  GeneralButton({this.color, this.onPressed, this.label, this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label,
            style: style,
          ),
        ),
      ),
    );
  }
}