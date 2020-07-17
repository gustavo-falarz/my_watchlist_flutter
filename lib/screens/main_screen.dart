import 'package:flutter/material.dart';
import 'package:mywatchlist/components/base_container.dart';
import 'package:mywatchlist/components/lists/content_list.dart';
import 'package:mywatchlist/model/content_data.dart';
import 'package:mywatchlist/screens/add_content_screen.dart';
import 'file:///C:/Users/Gustavo/StudioProjects/my_watchlist/lib/utils/task_controller.dart';
import 'package:mywatchlist/services/content_service.dart';
import 'file:///C:/Users/Gustavo/StudioProjects/my_watchlist/lib/utils/ui_utils.dart';
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
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Watchlist'),
            bottom: TabBar(tabs: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('ALL'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('MOVIES'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('SERIES'),
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              ContentList(type: null),
              ContentList(type: 'movie'),
              ContentList(type: 'series'),
            ],
          ),
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
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getContent();
  }

  void getContent() {
    TaskController(
      task: () async {
        var contentLst = await ContentService.findContentByUser();
        Provider.of<ContentData>(context, listen: false)
            .updateContentList(contentLst);
      },
      onStart: () {
        showProgress(context);
      },
      onError: (e) {
        showErrorDialog(context, message: e.toString());
      },
      onFinished: () {
        hideProgress(context);
      },
    ).execute();
  }
}
