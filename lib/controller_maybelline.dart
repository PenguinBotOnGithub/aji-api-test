import 'package:aji_api_test/maybelline.dart';
import 'package:aji_api_test/obj/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ControllerListProduct extends GetxController {
  RxList<ProductMoment> productResponseModel = <ProductMoment>[].obs;

  final isLoading = false.obs;

  var sessionUsername = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadSession();
    loadData();
  }

  void loadSession() {
    sessionUsername.value =
        LocalData.prefs.getString(LocalData.usernameKey) ?? "no data";
  }

  void loadData() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));

      if (response.statusCode == 200) {
        productResponseModel.value = productMomentFromJson(response.body);
      } else {
        print("Status code: " + response.statusCode.toString());
      }
      isLoading.value = false;
    } catch (e) {
      print("Error: " + e.toString());
    }
  }
}
