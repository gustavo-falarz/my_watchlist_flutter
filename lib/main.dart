import 'package:flutter/material.dart';
import 'package:mywatchlist/constants.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:mywatchlist/screens/add_content_screen.dart';
import 'package:mywatchlist/screens/content_detail_screen.dart';
import 'package:mywatchlist/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ContentData>(
      create: (context) => ContentData(),
      child: MaterialApp(
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => MainScreen(),
          ContentDetails.id: (context) => ContentDetails(),
          AddContentScreen.id: (context) => AddContentScreen(),
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
        home: MainScreen(),
      ),
    ),
  );
}
