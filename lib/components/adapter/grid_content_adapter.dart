import 'package:flutter/material.dart';
import 'package:mywatchlist/constants.dart';
import 'package:mywatchlist/model/content_model.dart';

class GridContentAdapter extends StatelessWidget {
  final ContentModel content;
  final Function onPressed;

  const GridContentAdapter({@required this.content, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: colorSecondary,
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Material(
                  elevation: 10.0,
                  child: Image.network(
                    content.poster,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 1,
                child: _ItemDescription(
                  title: content.title,
                  year: content.year,
                  director: content.director,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  const _ItemDescription({
    this.title,
    this.director,
    this.year,
  });

  final String title;
  final String director;
  final String year;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            year,
            style: const TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
