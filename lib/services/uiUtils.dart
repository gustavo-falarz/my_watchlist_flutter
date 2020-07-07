
import 'package:flutter/cupertino.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:provider/provider.dart';

void showProgress(BuildContext context){
  Provider.of<ContentData>(context, listen: false).showProgress(true);
}

void hideProgress(BuildContext context){
  Provider.of<ContentData>(context, listen: false).showProgress(false);
}