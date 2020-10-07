import 'package:flutter/material.dart';
import 'package:mywatchlist/constants.dart';
import 'package:mywatchlist/model/content.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:provider/provider.dart';

import '../adapter/content_adapter.dart';

class ContentList extends StatelessWidget {
  final String type;

  const ContentList({@required this.type});

  @override
  Widget build(BuildContext context) {
    List<Content> contentList = [];

    if (type != null) {
      contentList = Provider.of<ContentData>(context)
          .contentList
          .where((element) => element.type == type)
          .toList();
    } else {
      contentList = Provider.of<ContentData>(context).contentList;
    }
    contentList = contentList.reversed.toList();

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
