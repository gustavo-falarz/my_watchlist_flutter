import 'package:flutter/material.dart';
import 'package:mywatchlist/components/base_container.dart';
import 'package:mywatchlist/components/buttons/back_button.dart';
import 'package:mywatchlist/components/buttons/round_icon_button.dart';
import 'package:mywatchlist/constants.dart';
import 'package:mywatchlist/model/content_model.dart';
import 'package:mywatchlist/model/new_content_model.dart';
import 'package:mywatchlist/services/content_service.dart';
import 'package:mywatchlist/utils/data_utils.dart';
import 'package:mywatchlist/utils/ui_utils.dart';

class ContentDetails extends StatefulWidget {
  static const String id = 'details';

  @override
  _ContentDetailsState createState() => _ContentDetailsState();
}

class _ContentDetailsState extends State<ContentDetails> {
  @override
  Widget build(BuildContext context) {
    final ContentModel content = ModalRoute.of(context).settings.arguments;
    return BaseContainer(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 160.0),
              child: Material(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 140.0,
                    ),
                    Text(
                      content.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40.0),
                    ),
                    Text(
                      '(${content.year})',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    LabelValueWidget(
                      label: 'Genre',
                      value: content.genre,
                    ),
                    LabelValueWidget(
                      label: 'Plot',
                      value: content.plot,
                    ),
                    LabelValueWidget(
                      label: 'Director',
                      value: content.director,
                    ),
                    LabelValueWidget(
                      label: 'Actors',
                      value: content.actors,
                    ),
                    LabelValueWidget(
                      label: 'Miscellaneous',
                      value: ' Runtime: ${content.runtimeType}'
                          '\nReleased: ${content.released}'
                          '\nProduction: ${content.production}',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: colorPrimary,
            elevation: 10.0,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
            child: Container(
              width: double.maxFinite,
              height: 200.0,
              alignment: Alignment.topLeft,
              child: DefaultBackButton(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RoundIconButton(
                  icon: Icons.visibility,
                  color: accent,
                  iconColor: Colors.white,
                  onPressed: () {
                    archiveContent(content);
                  },
                ),
                SizedBox(
                  width: 50.0,
                ),
                RoundIconButton(
                  icon: Icons.delete,
                  color: accent,
                  iconColor: Colors.white,
                  onPressed: () {
                    deleteContent(content);
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 60.0),
            child: Material(
              elevation: 10.0,
              child: Hero(
                tag: 'posterImage${content.imdbID}',
                child: Image.network(
                  content.poster,
                  fit: BoxFit.fill,
                  height: 200.0,
                  width: 150.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  deleteContent(ContentModel content) async {
    showProgress(context);
    var newContent = NewContentModel(
      content: content,
      userId: await getUserId(),
    );
    try {
      var message = await ContentService.deleteFromWatchlist(newContent);
      showMyDialog(
        context,
        title: 'Success',
        message: message,
        function: () {
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showMyDialog(
        context,
        title: 'Error',
        message: e.message,
      );
    } finally {
      hideProgress(context);
    }
  }

  archiveContent(ContentModel content) async {
    showProgress(context);
    var newContent = NewContentModel(
      content: content,
      userId: await getUserId(),
    );
    try {
      var message = await ContentService.archiveFromWatchlist(newContent);
      showMyDialog(
        context,
        title: 'Success',
        message: message,
        function: () {
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showMyDialog(
        context,
        title: 'Error',
        message: e.message,
      );
    } finally {
      hideProgress(context);
    }
  }
}

class LabelValueWidget extends StatelessWidget {
  const LabelValueWidget({
    @required this.label,
    @required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            value,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
