import 'package:flutter/material.dart';
import 'package:mywatchlist/components/base_container.dart';
import 'package:mywatchlist/components/buttons/rounded_button.dart';
import 'package:mywatchlist/components/text_field/rounded_text_field.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'new-user';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<RegistrationScreen> {
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      backgroundColor: colorPrimary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            RoundedTextField(
              hint: "Email",
              onTextChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 16.0,
            ),
            RoundedButton(
              onPressed: () {},
              label: "Cadastrar-se",
              color: additionalButton,
            ),
          ],
        ),
      ),
    );
  }
}
