import 'package:http/http.dart';

class HttpService {
  static String baseUrl =
      'https://my-watchlist-server.herokuapp.com/';

  static Future<Response> doGet(String url) async {
    Response response = await get('$baseUrl$url');
    if (response.statusCode != 200) {
      throw Exception(response.toString());
    }
    return response;
  }
}
