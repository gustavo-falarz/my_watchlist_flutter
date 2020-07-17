import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:provider/provider.dart';

void showProgress(BuildContext context) {
  Provider.of<ContentData>(context, listen: false).showProgress(true);
}

void hideProgress(BuildContext context) {
  Provider.of<ContentData>(context, listen: false).showProgress(false);
}


void showSuccessDialog(BuildContext context, {String message}){
  showMyDialog(context, title: 'Success', message: message);
}


void showErrorDialog(BuildContext context, {String message}){
  showMyDialog(context, title: 'Oops', message: message);
}

Future<void> showMyDialog(BuildContext context,
    {@required String title, @required String message}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
