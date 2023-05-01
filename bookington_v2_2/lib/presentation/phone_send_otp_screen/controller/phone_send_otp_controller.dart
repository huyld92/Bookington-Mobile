import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:flutter/material.dart';

class PhoneSendOtpController extends GetxController with StateMixin {
  TextEditingController txtPhoneController = TextEditingController();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void getBack() {
    Get.back();
  }

  void registrationPhoneScreen() {
    Get.offAllNamed(AppRoutes.registrationPhoneScreen);
  }

  Future<void> sendOtp() async {
    Map<String, String> arg = {
      "rePhoneNumber": txtPhoneController.text,
      "isResetPassword": "true"
    };

    try {
      change(null, status: RxStatus.loading());

      await ApiClient.forgotPasswordVerify(txtPhoneController.text).then((result) {
        print('txtPhoneController.text:${txtPhoneController.text}');
        if (result.statusCode == 204) {
          Get.offNamed(AppRoutes.verifyPhoneNumberScreen, arguments: arg);
        } else {
          Get.defaultDialog(
              title: "Send otp Failed!", middleText: "Phone number error cannot send");
        }
      });
    } catch (error) {
      Logger.log(
          "PhoneSendOtpController error at sendOtp: ${error.toString()}");
      Get.defaultDialog(title: "Send otp Error!", middleText: error.toString());
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
