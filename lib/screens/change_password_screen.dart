import 'package:flutter/material.dart';
import 'package:mywatchlist/components/base_container.dart';
import 'package:mywatchlist/components/buttons/rounded_button.dart';
import 'package:mywatchlist/components/text_field/rounded_text_field.dart';
import 'package:mywatchlist/constants.dart';
import 'package:mywatchlist/screens/main_screen.dart';
import 'package:mywatchlist/services/user_service.dart';
import 'package:mywatchlist/utils/data_utils.dart';
import 'package:mywatchlist/utils/task_controller.dart';
import 'package:mywatchlist/utils/ui_utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String id = 'change-password';

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  String password;
  String confirmation;
  String email;

  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context).settings.arguments;
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
                obscure: true,
                onTextChanged: (value) {
                  password = value.trim();
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedTextField(
                hint: 'Repeat the password',
                obscure: true,
                onTextChanged: (value) {
                  confirmation = value.trim();
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                onPressed: () {
                  changePassword();
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

  void changePassword() {
    TaskController(
      task: () async {
        var user =
            await UserService.changePassword(email: email, password: password);
        saveUserId(user.id);
        showMyDialog(
          context,
          title: 'Success',
          message: 'Password changed successfully.'
              'You may now use the app.',
          function: () {
            Navigator.of(context).pop();
          },
        );
      },
      onStart: () {
        showProgress(context);
      },
      onError: (e) {
        showErrorDialog(
          context,
          message: e.message,
        );
      },
      onFinished: () {
        hideProgress(context);
      },
    ).execute();
  }

  void callMainScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      MainScreen.id,
    );
  }
}
