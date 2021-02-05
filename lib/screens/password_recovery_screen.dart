import 'package:flutter/material.dart';
import 'package:mywatchlist/components/base_container.dart';
import 'package:mywatchlist/components/buttons/rounded_button.dart';
import 'package:mywatchlist/components/text_field/rounded_text_field.dart';
import 'package:mywatchlist/model/result_model.dart';
import 'package:mywatchlist/services/user_service.dart';
import 'package:mywatchlist/utils/task_controller.dart';
import 'package:mywatchlist/utils/ui_utils.dart';

import '../constants.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  static const String id = 'password-recovery';

  @override
  _PasswordRecoveryScreenState createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  String email;

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Password recovery'),
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
                'Forgot your password?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Don't sweat it, fill in the email address you used to create "
                "your account and we will send you an email with "
                "instructions to reset your password.",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedTextField(
                hint: 'Email',
                onTextChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                onPressed: () {
                  recover();
                },
                label: 'Recover password',
                color: additionalButton,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void recover() {
    TaskController(
      task: () async {
        ResultModel result = await UserService.recoverPassword(email.trim());
        showMyDialog(
          context,
          title: 'Success',
          message: result.message,
          function: () {
            Navigator.pop(context);
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
}
