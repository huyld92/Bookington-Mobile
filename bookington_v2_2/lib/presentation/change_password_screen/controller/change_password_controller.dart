

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:flutter/material.dart';

class ChangePasswordController extends GetxController with StateMixin{
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

  void getBack() {
    Get.back();
  }



}