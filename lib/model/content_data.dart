import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mywatchlist/model/content_model.dart';

class ContentData extends ChangeNotifier {
  List<ContentModel> _contentList = [];
  List<ContentModel> _searchContentList = [];

  bool _progressVisible = false;

  UnmodifiableListView<ContentModel> get contentList {
    return UnmodifiableListView(_contentList);
  }

  UnmodifiableListView<ContentModel> get searchContentList {
    return UnmodifiableListView(_searchContentList);
  }

  void updateContentList(List<ContentModel> newContent) {
    _contentList = newContent;
    notifyListeners();
  }

  void updateSearchContentList(List<ContentModel> newContent) {
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
