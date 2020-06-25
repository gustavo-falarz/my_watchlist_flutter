import 'dart:convert';

import 'package:http/http.dart';
import 'package:mywatchlist/model/content.dart';
import 'package:mywatchlist/services/network.dart';

const url = 'content/find/';
const userID = '5a594508f6684e0007d2db5f';

class ContentService {
  static Future<List<Content>> findContentByUser() async {
    Response response = await HttpService.doGet('$url$userID');
    var json = jsonDecode(response.body);
    List<Content> list = Content.fromJsonList(json);
    return list;
  }
}
