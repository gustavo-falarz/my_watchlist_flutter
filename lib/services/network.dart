import 'dart:convert';

import 'package:http/http.dart';
import 'package:mywatchlist/utils/service_exception.dart';

class HttpService {
  static String baseUrl = 'https://my-watchlist-server.herokuapp.com/';
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Future<Response> doGet(String url) async {
    Response response = await get('$baseUrl$url');
    if (response.statusCode != 200) {
      throw Exception(response.toString());
    }
    check(response);
    return response;
  }

  static Future<Response> doPost(String url, Map<String, dynamic> body) async {
    var bodyJson = json.encode(body);
    Response response =
        await post('$baseUrl$url', headers: headers, body: bodyJson);
    if (response.statusCode != 200) {
      throw Exception(response.toString());
    }
    check(response);
    return response;
  }

  static void check(Response response) {
    var json = jsonDecode(response.body);
    bool status = json['status'];
    if (!status) {
      String message = json['message'];
      throw ServiceException(message);
    }
  }
}
