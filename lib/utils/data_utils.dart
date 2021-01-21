import 'package:shared_preferences/shared_preferences.dart';

  Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId");
  }

  void setUserId(String userId) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userId", userId);
  }

