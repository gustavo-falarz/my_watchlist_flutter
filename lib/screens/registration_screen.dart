import 'package:flutter/material.dart';
import 'package:mywatchlist/components/base_container.dart';
import 'package:mywatchlist/components/buttons/rounded_button.dart';
import 'package:mywatchlist/components/text_field/rounded_text_field.dart';
import 'package:mywatchlist/model/result_model.dart';
import 'package:mywatchlist/services/user_service.dart';
import 'package:mywatchlist/utils/task_controller.dart';
import 'package:mywatchlist/utils/ui_utils.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'register';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<RegistrationScreen> {
  String email;

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Sign-up"),
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
                child: Image.asset('images/popcorn.png'),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Just a few clicks away...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "In order to save your lists you need to create an account"
                " and for that we only ask for your email address."
                " But rest assured, this information is safely stored and "
                "won't be shared with third parties.",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedTextField(
                hint: "Email",
                onTextChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                onPressed: () {
                  register();
                },
                label: "Register",
                color: additionalButton,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    TaskController(
      task: () async {
        ResultModel result = await UserService.register(email.trim());
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
