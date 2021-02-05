import 'package:mywatchlist/model/auth_model.dart';
import 'package:mywatchlist/model/result_model.dart';
import 'package:mywatchlist/model/user_model.dart';

import '../utils/network.dart';

class UserService {
  static Future<UserModel> validate(String email, String password) async {
    const url = 'v1/user/validate';

    AuthModel authModel = AuthModel(email: email, password: password);
    var json = await HttpService.doPost(url, authModel.toJson());
    UserModel user = UserModel.fromJson(json);
    return user;
  }

  static Future<ResultModel> changePassword(
      String email, String password) async {
    const url = 'v1/user/change-password';

    AuthModel auth = AuthModel(email: email, password: password);
    var json = await HttpService.doPost(url, auth.toJson());
    ResultModel result = ResultModel.fromJson(json);
    return result;
  }

  static Future<ResultModel> register(String email) async {
    const url = 'v1/user/register';

    Map<String, String> map = {'email': email};
    var json = await HttpService.doPutForm(url, map);
    ResultModel result = ResultModel.fromJson(json);
    return result;
  }

  static Future<ResultModel> recoverPassword(String email) async {
    const url = 'v1/user/recover';

    Map<String, String> map = {'email': email};
    var json = await HttpService.doPost(url, map);
    ResultModel result = ResultModel.fromJson(json);
    return result;
  }
}
