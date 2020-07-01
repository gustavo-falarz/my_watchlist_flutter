import 'package:flutter/material.dart';
import 'package:mywatchlist/components/base_container.dart';
import 'file:///C:/Users/Gustavo/StudioProjects/my_watchlist/lib/components/lists/content_grid.dart';
import 'file:///C:/Users/Gustavo/StudioProjects/my_watchlist/lib/components/lists/content_list.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:mywatchlist/screens/add_content_screen.dart';
import 'package:mywatchlist/services/content_service.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
        ),
        body: ContentList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(
              context,
              AddContentScreen.id,
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getContent();
  }

  void getContent() async {
    Provider.of<ContentData>(context, listen: false).showProgress(true);
    var contentLst = await ContentService.findContentByUser();
    Provider.of<ContentData>(context, listen: false)
        .updateContentList(contentLst);
    Provider.of<ContentData>(context, listen: false).showProgress(false);
  }
}
