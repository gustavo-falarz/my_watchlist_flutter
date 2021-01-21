import 'dart:convert';

import 'package:http/http.dart';
import 'package:mywatchlist/model/content.dart';
import 'package:mywatchlist/model/dto/content_dto.dart';
import 'package:mywatchlist/services/message_utils.dart';
import 'package:mywatchlist/services/network.dart';
import 'package:mywatchlist/utils/data_utils.dart';


class ContentService {
  static Future<List<Content>> findContentByUser() async {
    const url = 'content/find';
    String userId = await getUserId();

    Response response = await HttpService.doGet('$url/$userId');
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

  static Future<String> addContentToWatchlist(ContentDTO dto) async {
    const url = 'content/add';
    Map<String, dynamic> body = dto.toJson();
    Response response = await HttpService.doPost('$url', body);
    return parseMessage(response);
  }

  static Future<String> archiveFromWatchlist(ContentDTO dto) async {
    const url = 'content/archive';
    Map<String, dynamic> body = dto.toJson();
    Response response = await HttpService.doPost('$url', body);
    return parseMessage(response);
  }

  static Future<String> deleteFromWatchlist(ContentDTO dto) async {
    const url = 'content/delete';
    Map<String, dynamic> body = dto.toJson();
    Response response = await HttpService.doPost('$url', body);
    return parseMessage(response);
  }


}
