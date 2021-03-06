import 'package:flutter/material.dart';
import 'package:mywatchlist/constants.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:mywatchlist/screens/add_content_screen.dart';
import 'package:mywatchlist/screens/content_detail_screen.dart';
import 'package:mywatchlist/screens/login_screen.dart';
import 'package:mywatchlist/screens/main_screen.dart';
import 'package:mywatchlist/screens/password_recovery_screen.dart';
import 'package:mywatchlist/screens/change_password_screen.dart';
import 'package:mywatchlist/screens/registration_screen.dart';
import 'package:provider/provider.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() {
  runApp(
    ChangeNotifierProvider<ContentData>(
      create: (context) => ContentData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [routeObserver],
        initialRoute: LoginScreen.id,
        routes: {
          MainScreen.id: (context) => MainScreen(),
          ContentDetails.id: (context) => ContentDetails(),
          AddContentScreen.id: (context) => AddContentScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ChangePasswordScreen.id: (context) => ChangePasswordScreen(),
          PasswordRecoveryScreen.id: (context) => PasswordRecoveryScreen(),
        },
        theme: ThemeData(
          primaryColor: colorPrimary,
          accentColor: accent,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: colorMainText,
            ),
          ),
        ),
      ),
    ),
  );
}
