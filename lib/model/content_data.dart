import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mywatchlist/model/content.dart';

class ContentData extends ChangeNotifier {
  List<Content> _contentList = [];
  List<Content> _searchContentList = [];

  bool _progressVisible = false;

  UnmodifiableListView<Content> get contentList {
    return UnmodifiableListView(_contentList);
  }

  UnmodifiableListView<Content> get searchContentList {
    return UnmodifiableListView(_searchContentList);
  }

  void updateContentList(List<Content> newContent) {
    _contentList = newContent;
    notifyListeners();
  }

  void updateSearchContentList(List<Content> newContent) {
    _searchContentList = newContent;
    notifyListeners();
  }

  bool get progressVisible {
    return _progressVisible;
  }

  void showProgress(bool show) {
    _progressVisible = show;
    notifyListeners();
  }
}
