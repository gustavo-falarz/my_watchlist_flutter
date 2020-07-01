import 'package:flutter/material.dart';
import 'package:mywatchlist/constants.dart';
import 'package:mywatchlist/model/content.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:provider/provider.dart';

import '../adapter/content_adapter.dart';

class ContentList extends StatelessWidget {
  final List<Content> content;

  const ContentList({this.content});

  @override
  Widget build(BuildContext context) {
    List<Content> contentList = Provider.of<ContentData>(context).contentList;

    return Container(
      color: colorContrast,
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 220.0,
        itemCount: contentList.length,
        itemBuilder: (context, index) {
          return ContentAdapter(
            content: contentList[index],
          );
        },
      ),
    );
  }
}
