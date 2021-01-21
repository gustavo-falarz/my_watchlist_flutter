import 'package:flutter/material.dart';
import 'package:mywatchlist/components/base_container.dart';
import 'package:mywatchlist/components/buttons/back_button.dart';
import 'package:mywatchlist/components/headers/top_search_header.dart';
import 'package:mywatchlist/components/lists/search_content_list.dart';
import 'package:mywatchlist/model/content.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:mywatchlist/model/dto/content_dto.dart';
import 'package:mywatchlist/services/content_service.dart';
import 'package:mywatchlist/utils/data_utils.dart';
import 'package:mywatchlist/utils/task_controller.dart';
import 'package:mywatchlist/utils/ui_utils.dart';
import 'package:provider/provider.dart';

class AddContentScreen extends StatefulWidget {
  static const String id = 'add-content';

  @override
  _AddContentScreenState createState() => _AddContentScreenState();
}

class _AddContentScreenState extends State<AddContentScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 160.0),
              child: SearchContentList(
                onClickAdd: (content) {
                  addToWatchlist(content);
                },
              ),
            ),
            TopSearchHeader(
              onClickSearch: (value) {
                findContent(value);
              },
            ),
            Row(
              children: <Widget>[
                DefaultBackButton(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 45.0,
                    left: 15.0,
                  ),
                  child: Text(
                    'Add new content',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addToWatchlist(Content content) {
    TaskController(
      task: () async {
        var contentDTO = ContentDTO(
          content: content,
          userId: await getUserId(),
        );
        var message = await ContentService.addContentToWatchlist(contentDTO);
        showMyDialog(
          context,
          title: 'Success',
          message: message,
          function: () {
            Navigator.pop(context);
          },
        );
      },
      onStart: () {
        showProgress(context);
      },
      onError: (e) {
        showErrorDialog(
          context,
          message: e.message,
        );
      },
      onFinished: () {
        hideProgress(context);
      },
    ).execute();
  }

  void findContent(String query) {
    TaskController(
      task: () async {
        var contentLst = await ContentService.findContentOnImdb(query.trim());
        Provider.of<ContentData>(context, listen: false)
            .updateSearchContentList(contentLst);
      },
      onStart: () {
        showProgress(context);
      },
      onError: (e) {
        showErrorDialog(
          context,
          message: e.message,
        );
      },
      onFinished: () {
        hideProgress(context);
      },
    ).execute();
  }
}
