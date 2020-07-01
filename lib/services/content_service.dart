import 'dart:convert';

import 'package:http/http.dart';
import 'package:mywatchlist/model/content.dart';
import 'package:mywatchlist/services/network.dart';

const userID = '5a594508f6684e0007d2db5f';

class ContentService {
  static Future<List<Content>> findContentByUser() async {
    const url = 'content/find';

    Response response = await HttpService.doGet('$url/$userID');
    var json = jsonDecode(response.body);
    List<Content> list = Content.fromJsonList(json);
    return list;
  }

  static Future<List<Content>> findContentOnImdb(String query) async {
    const url = 'content/searchOnImdb';

    Response response = await HttpService.doGet('$url/$query');
    var json = jsonDecode(response.body);
    List<Content> list = Content.fromJsonList(json);
    return list;
  }
}
