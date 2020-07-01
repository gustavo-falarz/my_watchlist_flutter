import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;

  final Function onPressed;

  final Color color;

  final Color iconColor;

  const RoundIconButton(
      {@required this.icon, this.onPressed, this.color, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10.0,
      onPressed: this.onPressed,
      child: Icon(
        icon,
        color: iconColor,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}
