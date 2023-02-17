import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/registration_verify_screen/models/verify_phone_number_model.dart';

import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VerifyPhoneNumberController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;
  String phoneNumber = "";
  Rx<VerifyPhoneNumberModel> verifyPhoneNumberModelObj =
      VerifyPhoneNumberModel().obs;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  @override
  void codeUpdated() {
    otpController.value.text = code!;
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
    loadData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> verifyOTP() async {
    try {
      String? phoneNumber = PrefUtils.getString("rePhoneNumber");
      print("cootp: " + otpController.value.text);

      var response =
          await ApiClient.verifyOtp(phoneNumber!, otpController.value.text);

      if (response.statusCode == 204) {
        //success
        Get.offNamed(AppRoutes.loginScreen);
      } else {
        Get.defaultDialog(
            title: "Verify otp failed!",
            middleText: jsonDecode(response.body)["Message"]);
      }
    } catch (error) {
      Get.defaultDialog(
          title: "Verify otp error!", middleText: error.toString());
    }
  }

  void loadData() {
    if(PrefUtils.getString("rePhoneNumber") != null){

      phoneNumber = PrefUtils.getString("rePhoneNumber")!.substring(7);

    }
  }
}
