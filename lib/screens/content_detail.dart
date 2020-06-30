import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywatchlist/components/round_icon_button.dart';
import 'package:mywatchlist/constants.dart';
import 'package:mywatchlist/model/content.dart';

class ContentDetails extends StatelessWidget {
  static const String id = 'details';

  @override
  Widget build(BuildContext context) {
    final Content content = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 160.0),
              child: Material(
                elevation: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 110.0,
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
                      value:
                          ' Runtime: ${content.runtimeType}'
                              '\nReleased: ${content.released}'
                              '\nProduction: ${content.production}',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            elevation: 10.0,
            child: Container(
              color: colorPrimary,
              width: double.maxFinite,
              height: 160.0,
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 180.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RoundIconButton(
                  icon: Icons.visibility,
                  color: accent,
                  iconColor: Colors.white,
                ),
                SizedBox(
                  width: 50.0,
                ),
                RoundIconButton(
                  icon: Icons.delete,
                  color: accent,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),

        ],
      ),
    );
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
