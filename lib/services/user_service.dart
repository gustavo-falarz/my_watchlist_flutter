import 'dart:convert';

import 'package:http/http.dart';
import 'package:mywatchlist/model/dto/user_dto.dart';
import 'package:mywatchlist/model/user.dart';

import 'network.dart';

class UserService {
  static Future<User> validate(String email, String password) async {
    const url = 'user/validate';

    UserDTO dto = UserDTO(email: email, password: password);
    var json = await HttpService.doPost(url, dto.toJson());
    User user = User.fromJson(json);
    return user;
  }

  static Future<User> register(String email, String password) async {
    const url = 'user/add';

    UserDTO dto = UserDTO(email: email, password: password);
    Response response = await HttpService.doPost(url, dto.toJson());
    var json = jsonDecode(response.body);
    User user = User.fromJson(json);
    return user;
  }
}
