import 'dart:convert';

import 'package:http/http.dart';
import 'package:mywatchlist/utils/service_exception.dart';

class HttpService {
  static String baseUrl = 'https://new-watchlist.herokuapp.com/';
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Future<dynamic> doGet(String url) async {
    Response response = await get('$baseUrl$url');
    check(response);
    return jsonDecode(response.body);
  }

  static Future<dynamic> doPost(String url, Map<String, dynamic> body) async {
    var bodyJson = json.encode(body);
    Response response =
        await post('$baseUrl$url', headers: headers, body: bodyJson);
    check(response);
    return jsonDecode(response.body);
  }

  static Future<dynamic> doPut(String url, Map<String, dynamic> body) async {
    var bodyJson = json.encode(body);
    Response response =
        await put('$baseUrl$url', headers: headers, body: bodyJson);
    check(response);
    return jsonDecode(response.body);
  }

  static void check(Response response) {
    if (response.statusCode != 200) {
      var json = jsonDecode(response.body);
      String message = json['message'];
      throw ServiceException(message);
    }
  }
}
