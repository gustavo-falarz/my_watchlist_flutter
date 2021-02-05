import 'dart:convert';

import 'package:http/http.dart';
import 'package:mywatchlist/utils/service_exception.dart';

class HttpService {
  static String baseUrl = 'new-watchlist.herokuapp.com';
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Future<dynamic> doGet(String url) async {
    var uri = Uri.https(baseUrl, url);
    Response response = await get(uri, headers: headers);
    check(response);
    return jsonDecode(response.body);
  }

  static Future<dynamic> doPost(String url, Map<String, dynamic> body) async {
    var bodyJson = json.encode(body);
    var uri = Uri.https(baseUrl, url);
    Response response = await post(uri, headers: headers, body: bodyJson);
    check(response);
    return jsonDecode(response.body);
  }

  static Future<dynamic> doPostForm(String url, Map<String, String> params) async {
    var uri = Uri.https(baseUrl, url, params);
    Response response = await post(uri, headers: headers);
    check(response);
    return jsonDecode(response.body);
  }

  static Future<dynamic> doPut(String url, Map<String, dynamic> body) async {
    var bodyJson = json.encode(body);
    var uri = Uri.https(baseUrl, url);
    Response response = await put(uri, headers: headers, body: bodyJson);
    check(response);
    return jsonDecode(response.body);
  }

  static Future<dynamic> doPutForm(String url, Map<String, String> params) async {
    var uri = Uri.https(baseUrl, url, params);
    Response response = await put(uri, headers: headers);
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
