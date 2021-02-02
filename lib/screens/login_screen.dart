import 'package:flutter/material.dart';
import 'package:mywatchlist/components/base_container.dart';
import 'package:mywatchlist/components/buttons/rounded_button.dart';
import 'package:mywatchlist/components/text_field/rounded_text_field.dart';
import 'package:mywatchlist/screens/main_screen.dart';
import 'package:mywatchlist/screens/registration_screen.dart';
import 'package:mywatchlist/services/user_service.dart';
import 'package:mywatchlist/utils/data_utils.dart';
import 'package:mywatchlist/utils/task_controller.dart';
import 'package:mywatchlist/utils/ui_utils.dart';

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
    checkUserSignedIn();
    return BaseContainer(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        backgroundColor: colorPrimary,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(
                height: 80.0,
              ),
              RoundedTextField(
                hint: "Email",
                onTextChanged: (text) {
                  email = text;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedTextField(
                obscure: true,
                hint: "Password",
                onTextChanged: (text) {
                  password = text;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                onPressed: () {
                  login();
                },
                label: "Sign-in",
                color: accent,
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RegistrationScreen.id,
                  );
                },
                label: "Sign-up",
                color: additionalButton,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Forgot password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    TaskController(
      task: () async {
        var user = await UserService.validate(email.trim(), password.trim());
        setUserId(user.id);
        callHomeScreen();
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

  void callHomeScreen() {
      Navigator.pushNamed(context, MainScreen.id);
  }

  void checkUserSignedIn() async {
    var userId = await getUserId();
    if (userId != null) {
      // callHomeScreen();
    }
  }
}
