import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordController extends GetxController {
  TextEditingController txtPasswordController = TextEditingController();

  TextEditingController txtPasswordConfirm = TextEditingController();

  Rx<bool> isShowPassword = false.obs;
  Rx<bool> isShowConfirm = false.obs;

  Future<void> createNewPassword() async {
    if (txtPasswordController.text == txtPasswordConfirm.text) {
      try {
        // String? phoneNumber = PrefUtils.getString("rePhoneNumber");
        Map<String, String> arg = Get.arguments;
        String phoneNumber = arg["rePhoneNumber"] ?? "";
        await ApiClient.updateNewPassword(
                phoneNumber, txtPasswordController.value.text)
            .then((result) {
          print("result.statusCode: ${result.statusCode}");
          if (result.statusCode == 200) {
            Get.snackbar(
              'Create new password',
              "Create new password successful",
              colorText: ColorConstant.black900,
              duration: const Duration(seconds: 3),
              backgroundColor: ColorConstant.whiteA700,
              icon: CustomImageView(
                  width: getSize(16),
                  height: getSize(16),
                  svgPath: ImageConstant.imgNotify),
            );
            PrefUtils.clearPreferencesData();
            Get.offNamed(AppRoutes.loginScreen);
          } else {
            Get.defaultDialog(
                title: "Create new password failed!",
                middleText: jsonDecode(result.body)["Message"]);
          }
        });
      } catch (error) {
        Logger.log(
            "CreateNewPasswordController ERROR at createNewPassword: ${error.toString()}");
        Get.defaultDialog(
            title: "Create new password error!",
            middleText: "Please create new password later");
      }
    }
  }

  void getBack() {
    Get.back();
  }
}
