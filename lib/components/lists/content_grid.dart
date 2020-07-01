import 'package:flutter/material.dart';
import 'package:mywatchlist/constants.dart';
import 'package:mywatchlist/model/content.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:mywatchlist/screens/content_detail_screen.dart';
import 'package:provider/provider.dart';

import '../adapter/grid_content_adapter.dart';

class ContentGrid extends StatelessWidget {
  final List<Content> content;

  const ContentGrid({this.content});

  @override
  Widget build(BuildContext context) {
    List<Content> contentList = Provider.of<ContentData>(context).contentList;

    return Container(
      color: colorContrast,
      child: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: contentList.length,
        itemBuilder: (context, index) {
          return GridContentAdapter(
            onPressed: () {
              Navigator.pushNamed(
                context,
                ContentDetails.id,
                arguments: contentList[index],
              );
            },
            content: contentList[index],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 4),
      ),
    );
  }
}
