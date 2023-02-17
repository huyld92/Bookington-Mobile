import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/app_url.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  late ApiClient apiClient;

  TextEditingController txtPhoneController = TextEditingController();

  TextEditingController txtPasswordController = TextEditingController();

  Rx<bool> isShowPassword = false.obs;

  var loginProcess = false.obs;


  @override
  void onInit() async {
    print('onInit');
    if(PrefUtils.getString("fullName") != null){
      print('login: ' +PrefUtils.getString("fullName")!);
    }
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    print('ready');

    super.onReady();
  }

  @override
  void onClose() {
    print('close');
    super.onClose();
  }

  Future<void> login(String phone, String password) async {
    refreshText();
    String errorMessage = "";
    try {
      loginProcess(true);

      var jsonResult = await ApiClient.loginWithPhone(phone, password);

      if (!jsonResult["isError"]) {
        //success
        LoginModel loginModel = LoginModel.fromJson(jsonResult["result"]);
        PrefUtils.setAccessToken(loginModel.sysToken);
        PrefUtils.setString("userID", loginModel.userID);
        PrefUtils.setString("fullName", loginModel.fullName);
        PrefUtils.setString("phoneNumber", loginModel.phoneNumber);
        Get.offNamed(AppRoutes.homeScreen);

      } else {
        errorMessage = jsonResult["Message"];
        Get.defaultDialog(title: "Login Failed!", middleText: errorMessage);
      }
      print('end');
    } catch (error) {
      Get.defaultDialog(title: "Login Failed!", middleText: error.toString());
      print("Login controller: " + error.toString());    } finally{
    loginProcess(false);
    }
  }

  void refreshText() {
    txtPhoneController.clear();
    txtPasswordController.clear();
  }

  void registrationPhoneScreen() {
    Get.toNamed(AppRoutes.registrationPhoneScreen);
  }
}
