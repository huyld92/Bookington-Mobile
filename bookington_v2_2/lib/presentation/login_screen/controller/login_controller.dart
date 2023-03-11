import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController with StateMixin {
  late ApiClient apiClient;

  TextEditingController txtPhoneController = TextEditingController();

  TextEditingController txtPasswordController = TextEditingController();

  Rx<bool> isShowPassword = false.obs;

  var loginProcess = false.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onReady() async {
    loadData();
    super.onReady();
  }

  Future<void> login(String phone, String password) async {
    refreshText();

    try {
      change(null, status: RxStatus.loading());
      loginProcess(true);

      ApiClient.loginWithPhone(phone, password).then((result) {
        print(result.statusCode);

        if (result.statusCode == 200) {
          final jsonResult = jsonDecode(result.body);
          LoginModel loginModel = LoginModel.fromJson(jsonResult["result"]);
          PrefUtils.setAccessToken(loginModel.sysToken);
          PrefUtils.setString("userID", loginModel.userID);
          PrefUtils.setString("fullName", loginModel.fullName);
          PrefUtils.setString("phoneNumber", loginModel.phoneNumber);
          Get.offNamed(AppRoutes.homeScreen);
        } else {
          final jsonResult = jsonDecode(result.body);
          String errorMessage = jsonResult["Message"];
          Get.defaultDialog(title: "Login Failed!", middleText: errorMessage);
        }
      });
    } catch (error) {
      Get.defaultDialog(title: "Login Failed!", middleText: error.toString());
      print("Login controller: " + error.toString());
    } finally {
      // change(null, status: RxStatus.success());
      Future.delayed(const Duration(milliseconds: 1500), () {
        change(null, status: RxStatus.success());
      });
    }
  }

  void refreshText() {
    // txtPhoneController.clear();
    txtPasswordController.clear();
  }

  void registrationPhoneScreen() {
    Get.offNamed(AppRoutes.registrationPhoneScreen);
  }

  void loadData() {
    var arg = Get.arguments;
    if (arg["timeOut"] != null) {
      Get.defaultDialog(
          title: "Session Expired",
          content: Center(
            child: Text("Please login again.",
                style: AppStyle.txtManropeSemiBold14),
          ),
          cancel: TextButton(
            child: Text("OK", style: AppStyle.txtManropeSemiBold16Blue500),
            onPressed: () {
              Get.back();
            },
          ));
    }
  }
}
