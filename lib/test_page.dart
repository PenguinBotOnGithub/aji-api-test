import 'package:aji_api_test/controller_maybelline.dart';
import 'package:aji_api_test/login_page.dart';
import 'package:aji_api_test/obj/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});

  final controller = Get.put(ControllerListProduct());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bjirrrr"),
        actions: [
          IconButton(
              onPressed: () async {
                await LocalData.prefs.setString(LocalData.usernameKey, "");
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Username: " + controller.sessionUsername.value),
            Obx(
              () => controller.isLoading.value
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.productResponseModel.length,
                      itemBuilder: (context, index) {
                        var product = controller.productResponseModel[index];
                        return ListTile(
                          title: Text(product.name),
                          subtitle: Text("${product.id}"),
                        );
                      }),
            ),
          ],
        ),
      )),
    );
  }
}
