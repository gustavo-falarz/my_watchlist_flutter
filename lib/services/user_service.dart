import 'dart:convert';

import 'package:http/http.dart';
import 'package:mywatchlist/model/new_user_model.dart';
import 'file:///C:/Users/Gustavo/StudioProjects/my_watchlist/lib/model/auth_model.dart';
import 'package:mywatchlist/model/result_model.dart';
import 'package:mywatchlist/model/user_model.dart';

import 'network.dart';

class UserService {
  static Future<UserModel> validate(String email, String password) async {
    const url = 'v1/user/validate';

    AuthModel dto = AuthModel(email: email, password: password);
    var json = await HttpService.doPost(url, dto.toJson());
    UserModel user = UserModel.fromJson(json);
    return user;
  }

  static Future<ResultModel> register(String email) async {
    const url = 'v1/user/register';

    NewUserModel dto = NewUserModel(email: email);
    Response response = await HttpService.doPut(url, dto.toJson());
    var json = jsonDecode(response.body);
    ResultModel result = ResultModel.fromJson(json);
    return result;
  }
}
