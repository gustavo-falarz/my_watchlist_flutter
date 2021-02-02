import 'package:flutter/material.dart';
import 'package:mywatchlist/components/buttons/round_icon_button.dart';
import 'package:mywatchlist/constants.dart';
import 'package:mywatchlist/model/content_model.dart';

class SearchContentAdapter extends StatelessWidget {
  final ContentModel content;
  final Function onCLickAdd;

  const SearchContentAdapter({@required this.content, this.onCLickAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        isThreeLine: true,
        subtitle: Text(
          content.year,
        ),
        leading: Image.network(
          content.poster,
          height: 72,
          width: 40,
          fit: BoxFit.fill,
        ),
        title: Text(content.title),
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundIconButton(
            icon: Icons.add,
            color: accent,
            iconColor: Colors.white,
            onPressed: onCLickAdd,
          ),
        ),
      ),
    );
  }
}
