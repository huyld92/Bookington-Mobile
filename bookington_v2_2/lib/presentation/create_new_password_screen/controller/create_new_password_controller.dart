

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordController extends GetxController {
   TextEditingController txtPasswordController = TextEditingController();

  TextEditingController txtPasswordConfirm = TextEditingController();

  Rx<bool> isShowPassword = false.obs;
  Rx<bool> isShowConfirm = false.obs;

  void createNewPassword() {
    Get.offAllNamed(AppRoutes.loginScreen);
   }

  void getBack() {Get.back();}

}