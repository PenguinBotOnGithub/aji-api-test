import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static late SharedPreferences prefs;
  static String usernameKey = "username";

  LocalData();

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
