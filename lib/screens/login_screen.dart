import 'package:flutter/material.dart';
import 'package:mywatchlist/components/buttons/rounded_button.dart';
import 'package:mywatchlist/components/text_field/rounded_text_field.dart';
import 'package:mywatchlist/screens/main_screen.dart';
import 'package:mywatchlist/screens/registration_screen.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem-vindo"),
      ),
      backgroundColor: colorPrimary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            RoundedTextField(
              hint: "Email",
              onTextChanged: (text) {
                email = text;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            RoundedTextField(
              hint: "Senha",
              onTextChanged: (text) {
                password = text;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  MainScreen.id,
                );
              },
              label: "Entrar",
              color: accent,
            ),
            SizedBox(
              height: 16.0,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RegistrationScreen.id,
                );
              },
              label: "Cadastrar-se",
              color: additionalButton,
            ),
          ],
        ),
      ),
    );
  }
}
