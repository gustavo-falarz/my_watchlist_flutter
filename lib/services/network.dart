import 'dart:convert';

import 'package:http/http.dart';

class HttpService {
  static String baseUrl = 'https://my-watchlist-server.herokuapp.com/';

  static Future<Response> doGet(String url) async {
    Response response = await get('$baseUrl$url');
    if (response.statusCode != 200) {
      throw Exception(response.toString());
    }
    return response;
  }

  static Future<Response> doPost(String url, String body) async {
    String strBody = json.encode(body);
    Response response = await post('$baseUrl$url', body: strBody);
    if (response.statusCode != 200) {
      throw Exception(response.toString());
    }
    return response;
  }
}
