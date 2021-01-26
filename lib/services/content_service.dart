import 'package:mywatchlist/model/content.dart';
import 'package:mywatchlist/model/dto/content_dto.dart';
import 'package:mywatchlist/services/network.dart';
import 'package:mywatchlist/utils/data_utils.dart';
import 'package:mywatchlist/utils/message_utils.dart';


class ContentService {
  static Future<List<Content>> findContentByUser() async {
    const url = 'content/find';
    String userId = await getUserId();

    var json = await HttpService.doGet('$url/$userId');
    List<Content> list = Content.fromJsonList(json);
    return list;
  }

  static Future<List<Content>> findContentOnImdb(String query) async {
    const url = 'content/searchOnImdb';

    var json = await HttpService.doGet('$url/$query');
    List<Content> list = Content.fromJsonList(json);
    return list;
  }

  static Future<String> addContentToWatchlist(ContentDTO dto) async {
    const url = 'content/add';
    Map<String, dynamic> body = dto.toJson();
    var json = await HttpService.doPost('$url', body);
    return parseMessage(json);
  }

  static Future<String> archiveFromWatchlist(ContentDTO dto) async {
    const url = 'content/archive';
    Map<String, dynamic> body = dto.toJson();
    var json = await HttpService.doPost('$url', body);
    return parseMessage(json);
  }

  static Future<String> deleteFromWatchlist(ContentDTO dto) async {
    const url = 'content/delete';
    Map<String, dynamic> body = dto.toJson();
    var json = await HttpService.doPost('$url', body);
    return parseMessage(json);
  }
}
