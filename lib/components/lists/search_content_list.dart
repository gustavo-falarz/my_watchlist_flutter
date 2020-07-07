import 'package:flutter/material.dart';
import 'package:mywatchlist/components/adapter/search_content_adapter.dart';
import 'package:mywatchlist/constants.dart';
import 'package:mywatchlist/model/content.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:provider/provider.dart';

class SearchContentList extends StatelessWidget {
  final Function onClickAdd;

  const SearchContentList({this.onClickAdd});

  @override
  Widget build(BuildContext context) {
    List<Content> contentList =
        Provider.of<ContentData>(context).searchContentList;

    return Container(
      color: colorContrast,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20.0),
        itemCount: contentList.length,
        itemBuilder: (context, index) {
          return SearchContentAdapter(
            content: contentList[index],
            onCLickAdd: () {
              onClickAdd(contentList[index]);
            },
          );
        },
      ),
    );
  }
}
