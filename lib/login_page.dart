import 'package:aji_api_test/obj/shared_preferences.dart';
import 'package:aji_api_test/test_page.dart';
import 'package:aji_api_test/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  late SharedPreferences prefs;
  late String? usernameSession;

  @override
  void initState() {
    super.initState();
    prefs = LocalData.prefs;
    usernameSession = prefs.getString(LocalData.usernameKey) ?? "";
    usernameTextController.text = usernameSession!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Login"),
            styledTextField(controller: usernameTextController),
            styledTextField(controller: passwordTextController),
            OutlinedButton(
                onPressed: () async {
                  print(usernameTextController.text);
                  await prefs.setString(
                      LocalData.usernameKey, usernameTextController.text);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => TestPage(),
                  ));
                },
                child: Text("Login")),
            OutlinedButton(onPressed: () {}, child: Text("Register")),
          ],
        ),
      ),
    );
  }
}
