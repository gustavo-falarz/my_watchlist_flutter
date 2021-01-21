import 'package:flutter/material.dart';

import '../../constants.dart';

class RoundedTextField extends StatelessWidget {
  final Function onTextChanged;
  final String hint;

  const RoundedTextField({Key key, this.onTextChanged, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        onTextChanged(text);
      },
      textAlign: TextAlign.left,
      decoration: kRoundedTextFieldDecoration.copyWith(
        hintText: hint,
      ),
    );
  }
}
