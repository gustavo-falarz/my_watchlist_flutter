import 'dart:convert';

import 'package:http/http.dart';

String parseMessage(Response response) {
  var json = jsonDecode(response.body);
  String message = json['data']['message'];
  return message;
}
