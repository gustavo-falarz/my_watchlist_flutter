import 'package:flutter/material.dart';
import 'package:mywatchlist/components/buttons/round_icon_button.dart';

import '../../constants.dart';

class TopSearchHeader extends StatelessWidget {
  final Function onClickSearch;

  const TopSearchHeader({this.onClickSearch});

  @override
  Widget build(BuildContext context) {
    String query = '';

    return Container(
      height: 180.0,
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
                    onChanged: (value) {
                      query = value;
                    },
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
                    onPressed: () {
                      onClickSearch(query);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
