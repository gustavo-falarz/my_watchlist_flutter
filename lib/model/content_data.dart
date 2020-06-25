import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mywatchlist/model/content.dart';

class ContentData extends ChangeNotifier {
  List<Content> _contentList = [];

  bool _progressVisible = false;

  UnmodifiableListView<Content> get contentList {
    return UnmodifiableListView(_contentList);
  }

  bool get progressVisible {
    return _progressVisible;
  }

  void updateContentList(List<Content> newContent) {
    _contentList = newContent;
    notifyListeners();
  }

  void showProgress(bool show) {
    _progressVisible = show;
    notifyListeners();
  }
}
