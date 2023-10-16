import 'package:aji_api_test/login_page.dart';
import 'package:aji_api_test/obj/shared_preferences.dart';
import 'package:aji_api_test/test_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  var data = LocalData();
  data.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: (LocalData.prefs.getString(LocalData.usernameKey) ?? "").isEmpty
            ? LoginPage()
            : TestPage());
  }
}
