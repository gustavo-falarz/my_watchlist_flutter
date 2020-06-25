import 'package:flutter/cupertino.dart';
import 'package:mywatchlist/model/content.dart';

class ContentDetails extends StatelessWidget {
  static const String id = 'details';

  @override
  Widget build(BuildContext context) {

    final Content content = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Image.network(content.poster),
    );
  }
}
