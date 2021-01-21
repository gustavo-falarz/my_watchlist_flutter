import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final Color color;

  RoundedButton(
      {@required this.onPressed, @required this.label, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: this.color,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: this.onPressed,
        minWidth: double.infinity,
        height: 42.0,
        child: Text(
          this.label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
