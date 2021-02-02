import 'package:mywatchlist/model/content_model.dart';
import 'package:mywatchlist/model/new_content_model.dart';
import 'package:mywatchlist/services/network.dart';
import 'package:mywatchlist/utils/data_utils.dart';
import 'package:mywatchlist/utils/message_utils.dart';


class ContentService {
  static Future<List<ContentModel>> findContentByUser() async {
    const url = 'v1/content/find';
    String userId = await getUserId();

    var json = await HttpService.doGet('$url/$userId');
    List<ContentModel> list = ContentModel.fromJsonList(json);
    return list;
  }

  static Future<List<ContentModel>> findContentOnImdb(String query) async {
    const url = 'v1/content/searchOnImdb';

    var json = await HttpService.doGet('$url/$query');
    List<ContentModel> list = ContentModel.fromJsonList(json);
    return list;
  }

  static Future<String> addContentToWatchlist(NewContentModel newContent) async {
    const url = 'v1/content/add';
    Map<String, dynamic> body = newContent.toJson();
    var json = await HttpService.doPost('$url', body);
    return parseMessage(json);
  }

  static Future<String> archiveFromWatchlist(NewContentModel newContent) async {
    const url = 'v1/content/archive';
    Map<String, dynamic> body = newContent.toJson();
    var json = await HttpService.doPost('$url', body);
    return parseMessage(json);
  }

  static Future<String> deleteFromWatchlist(NewContentModel newContent) async {
    const url = 'v1/content/delete';
    Map<String, dynamic> body = newContent.toJson();
    var json = await HttpService.doPost('$url', body);
    return parseMessage(json);
  }
}
