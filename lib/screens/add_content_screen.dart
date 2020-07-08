import 'package:flutter/material.dart';
import 'package:mywatchlist/components/base_container.dart';
import 'package:mywatchlist/components/buttons/back_button.dart';
import 'package:mywatchlist/components/headers/top_search_header.dart';
import 'package:mywatchlist/components/lists/search_content_list.dart';
import 'package:mywatchlist/model/content.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:mywatchlist/model/content_dto.dart';
import 'package:mywatchlist/services/content_service.dart';
import 'package:mywatchlist/services/ui_utils.dart';
import 'package:provider/provider.dart';

class AddContentScreen extends StatefulWidget {
  static const String id = 'add';

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

  void addToWatchlist(Content content) async {
    showProgress(context);
    var contentDTO = ContentDTO(
      content: content,
      userId: userID,
    );
    try {
      var message = await ContentService.addContentToWatchlist(contentDTO);
      showMyDialog(context, title: 'Success', message: message);
    } catch (e) {
      showMyDialog(context, title: 'Error', message: e.message);
    } finally {
      hideProgress(context);
    }
  }

  void findContent(String query) async {
    showProgress(context);
    try {
      var contentLst = await ContentService.findContentOnImdb(query.trim());
      Provider.of<ContentData>(context, listen: false)
          .updateSearchContentList(contentLst);
    } catch (e) {
      showMyDialog(context, title: 'Error', message: e.message);
    } finally {
      hideProgress(context);
    }
  }
}
