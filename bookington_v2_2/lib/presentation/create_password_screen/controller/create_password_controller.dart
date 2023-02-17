import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/login_screen/controller/login_controller.dart';
import 'package:bookington_v2_2/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreatePasswordController extends GetxController {
  TextEditingController txtPassword = TextEditingController();

  TextEditingController txtPasswordConfirm = TextEditingController();

    Rx<bool> isShowPassword = false.obs;
  Rx<bool> isShowConfirm = false.obs;

  @override
  void onInit() {
    // phone = PrefUtils.sharedPreferences!.getString("rePhoneNumber")!;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
    txtPassword.dispose();
    txtPasswordConfirm.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    txtPassword.dispose();
    txtPasswordConfirm.dispose();
  }

  Future<void> createPassword() async {
    if (txtPassword.text != txtPasswordConfirm.text) {
      txtPassword.clear();
      txtPasswordConfirm.clear();
      Get.defaultDialog(
          title: "Create new Failed!", middleText: "Password don't match!");
      return;
    }
    try {
      String? phoneNumber = PrefUtils.getString("rePhoneNumber");

      var jsonResult = await ApiClient.signUp(
        phoneNumber!,
        txtPassword.text,
        phoneNumber,
      );

      print(jsonResult.toString());

      if (!jsonResult["isError"]) {
        //success
        var jsonResult =
            await ApiClient.loginWithPhone(phoneNumber, txtPassword.text);
        print(jsonResult.toString());
        PrefUtils.clearPreferencesData();
        Get.offNamed(AppRoutes.loginScreen);
        print(jsonResult.toString());
      } else {
        Get.defaultDialog(
            title: "Create new Failed!", middleText: jsonResult["Message"]);
      }
    } catch (error) {
      Get.defaultDialog(
          title: "Create new Error!", middleText: error.toString());
    }
  }
}
