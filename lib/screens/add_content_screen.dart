import 'package:flutter/material.dart';
import 'package:mywatchlist/components/buttons/back_button.dart';
import 'package:mywatchlist/components/buttons/round_icon_button.dart';
import 'package:mywatchlist/constants.dart';

class AddContentScreen extends StatelessWidget {
  static const String id = 'add';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Container(
            height: 200.0,
            child: Material(
              color: colorPrimary,
              elevation: 10.0,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: TextField(
                          textAlign: TextAlign.center,
                          decoration: kRoundedTextFieldDecoration.copyWith(
                            hintText: 'Search',
                          )),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 48.0,
                        child: RoundIconButton(
                          icon: Icons.search,
                          color: accent,
                          iconColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              DefaultBackButton(),
              Padding(
                padding: const EdgeInsets.only(top: 45.0, left: 15.0,),
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
    );
  }
}
