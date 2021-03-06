import 'package:flutter/material.dart';
import 'package:mywatchlist/constants.dart';
import 'package:mywatchlist/model/content_model.dart';
import 'package:mywatchlist/screens/content_detail_screen.dart';

class ContentAdapter extends StatelessWidget {
  final ContentModel content;

  const ContentAdapter({@required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ContentDetails.id,
          arguments: content,
        );
      },
      child: Card(
        color: colorSecondary,
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Material(
                  elevation: 10.0,
                  child: Hero(
                    tag: 'posterImage${content.imdbID}',
                    child: Image.network(
                      content.poster,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 3,
                child: _ItemDescription(
                  title: content.title,
                  year: content.year,
                  director: content.director,
                ),
              ),
              const Icon(
                Icons.visibility,
                size: 25.0,
                color: colorMainText,
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
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            director,
            style: const TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
