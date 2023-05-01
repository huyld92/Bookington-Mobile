import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:flutter/material.dart';

class RegistrationPhoneController extends GetxController with StateMixin{
  TextEditingController txtPhoneController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();

  TextEditingController txtPasswordConfirm = TextEditingController();

  Rx<bool> isShowPassword = false.obs;
  Rx<bool> isShowConfirm = false.obs;


  @override
  void onInit() {
    change(null, status: RxStatus.success());

    super.onInit();

  }


  Future<void> registrationWithPhone() async {
    try {
      change(null, status: RxStatus.loading());
      await ApiClient.register(txtPhoneController.text,
          txtPasswordController.text, txtPhoneController.text).then((result) {
        if (result.statusCode == 201) {
          PrefUtils.setString("rePhoneNumber", txtPhoneController.text);
          Map<String, String> arg = {
            "rePhoneNumber": txtPhoneController.text,
            "isResetPassword": "false"
          };
          Get.toNamed(AppRoutes.verifyPhoneNumberScreen, arguments: arg);
        } else {
          Get.defaultDialog(
              title: "Send Otp Failed!",
              middleText: jsonDecode(result.body)["Message"]);
        }
      });

    } catch (error) {
      Logger.log("data${error.toString()}");
      Get.defaultDialog(
          title: "send otp Failed!", middleText: error.toString());
    } finally{
      change(null, status: RxStatus.success());
    }
    txtPasswordController.clear();
    txtPasswordConfirm.clear();
    // Get.toNamed(AppRoutes.verifyPhoneNumberScreen, arguments: arg);
  }

  loginScreen() {
    Get.offNamed(AppRoutes.loginScreen);
  }
}
