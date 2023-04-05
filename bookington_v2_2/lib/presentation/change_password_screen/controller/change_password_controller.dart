import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
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
        if (result.statusCode == 200) {
          ProfileController profileController = Get.find();
          Map<String, bool> arg = {"isChangePassword": true};
          profileController.logout(arg);
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          ProfileController profileController = Get.find();
          Map<String, bool> arg = {"timeOut": true};
          profileController.logout(arg);
        } else {
          print('errror');
        }
      });
    }
  }
}
