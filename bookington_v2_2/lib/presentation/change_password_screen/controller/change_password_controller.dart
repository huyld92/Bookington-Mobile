// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:flutter/material.dart';

class ChangePasswordController extends GetxController with StateMixin {
  TextEditingController txtOldPasswordController = TextEditingController();
  TextEditingController txtNewPasswordController = TextEditingController();
  TextEditingController txtConfirmController = TextEditingController();
  Rx<bool> isShowOldPassword = false.obs;
  Rx<bool> isShowNewPassword = false.obs;
  Rx<bool> isShowConfirmPassword = false.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onClose() {
    txtOldPasswordController.dispose();
    txtNewPasswordController.dispose();
    txtConfirmController.dispose();
    super.onClose();
  }

  void getBack() {
    Get.back();
  }

  void changePassword() {
    String userID = PrefUtils.getString("userID") ?? "";
    String oldPassword = txtOldPasswordController.text;
    String newPassword = txtNewPasswordController.text;
    String confirmPassword = txtConfirmController.text;
    if (newPassword == confirmPassword) {
      ApiClient.changePassword(
              userID, oldPassword, newPassword, confirmPassword)
          .then((result) {
        print('statusCode: ${result.statusCode}');
        if (result.statusCode == 204) {
          Map<String, bool> arg = {"isChangePassword": true};
          logout(arg);
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          Map<String, bool> arg = {"timeOut": true};
          logout(arg);
        } else if (result.statusCode == 400) {
          Get.defaultDialog(title: "Change password", content: Text("Change password failed!\n${jsonDecode(result.body)["Message"]}", style: AppStyle.txtManropeRegular16,));
        } else {
          Get.defaultDialog(title: "Change password", content: Text("Change password failed!\n\n Cannot change password now. Please do it later}", style: AppStyle.txtManropeRegular16,));

          Logger.log(
              "ChangePasswordController error at changePassword: ${result.statusCode}. \n ${result.body}");
        }
      });
    }
  }

  void logout(Map<String, bool> arg) {
    PrefUtils.clearPreferencesData();
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }
}
