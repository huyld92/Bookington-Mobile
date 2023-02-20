import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/app_url.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/registration_phone_screen/models/registration_phone_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPhoneController extends GetxController {
  TextEditingController txtPhoneController = TextEditingController();

  Rx<RegistrationModel> registraionPhoneModelObj = RegistrationModel().obs;

  TextEditingController txtPasswordController = TextEditingController();

  TextEditingController txtPasswordConfirm = TextEditingController();

  Rx<bool> isShowPassword = false.obs;
  Rx<bool> isShowConfirm = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> registrationWithPhone() async {
    try {
      var response = await ApiClient.register(txtPhoneController.text,
          txtPasswordController.text, txtPhoneController.text);

      if (response.statusCode == 200) {
        var response = await ApiClient.sendSms(txtPhoneController.text);

        print(response.statusCode);

        if (response.statusCode == 200) {
          PrefUtils.setString("rePhoneNumber", txtPhoneController.text);
          Get.offNamed(AppRoutes.verifyPhoneNumberScreen);
        } else {
          Get.defaultDialog(
              title: "Send Otp Failed!",
              middleText: jsonDecode(response.body)["Message"]);
        }
      } else {
        print('Error create accont');
      }
    } catch (error) {
      Get.defaultDialog(
          title: "send otp Failed!", middleText: error.toString());
    }

    PrefUtils.setString("rePhoneNumber", txtPhoneController.text);
    Get.offNamed(AppRoutes.verifyPhoneNumberScreen);
  }

  loginScreen() {
    Get.offNamed(AppRoutes.loginScreen);
  }
}
