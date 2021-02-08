import 'package:flutter/material.dart';
import 'package:mywatchlist/components/base_container.dart';
import 'package:mywatchlist/components/buttons/rounded_button.dart';
import 'package:mywatchlist/components/text_field/rounded_text_field.dart';
import 'package:mywatchlist/constants.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String id = 'change-password';

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Change password'),
        ),
        backgroundColor: colorPrimary,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 150.0,
                child: Image.asset('images/padlock.png'),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'Change your password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Please inform a new password',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedTextField(
                hint: 'New password',
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedTextField(
                hint: 'Repeat the password',
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                onPressed: () {
                  changPassword();
                },
                color: accent,
                label: 'Change password',
              )
            ],
          ),
        ),
      ),
    );
  }

  void changPassword() {}
}
