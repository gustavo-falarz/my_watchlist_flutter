import 'package:flutter/material.dart';

import '../../constants.dart';

class RoundedTextField extends StatelessWidget {
  final Function onTextChanged;
  final String hint;
  final bool obscure;

  const RoundedTextField({Key key, this.onTextChanged, this.hint, this.obscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        onTextChanged(text);
      },
      textAlign: TextAlign.left,
      obscureText: obscure == null ? false : true,
      decoration: kRoundedTextFieldDecoration.copyWith(
      hintText: hint,
    ),);
  }
}
