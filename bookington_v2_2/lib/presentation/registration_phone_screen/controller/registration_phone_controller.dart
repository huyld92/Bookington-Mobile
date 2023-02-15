import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/app_url.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/registration_phone_screen/models/registration_phone_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPhoneController extends GetxController {
  TextEditingController txtPhone = TextEditingController();

  Rx<RegistrationModel> registraionPhoneModelObj = RegistrationModel().obs;
  RxString controllerText = ''.obs;

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
    txtPhone.dispose();
  }

  Future<void> registrationWithPhone() async {
    var headers = {'Content-Type': 'application/json; charset=utf-8'};
    try {
      var jsonResult = await ApiClient.sendSms(txtPhone.text);

      print(jsonResult.toString());

      if (!jsonResult["isError"]) {
        //success
        PrefUtils.setString("rePhoneNumber",txtPhone.text);
        Get.offNamed(AppRoutes.verifyPhoneNumberScreen);

      } else {
        Get.defaultDialog(title: "Login Failed!", middleText: jsonResult["Message"]);
      }
    } catch (error) {
      Get.defaultDialog(title: "send otp Failed!", middleText: error.toString());
    }
  }
}
