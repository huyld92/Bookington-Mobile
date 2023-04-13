


import 'package:bookington_v2_2/core/app_export.dart';
import 'package:flutter/material.dart';

class PhoneSendOtpController extends GetxController with StateMixin{
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

  void sendOtp() {
     Map<String,String> arg = {"rePhoneNumber":txtPhoneController.text,"isResetPassword":"true"};
    Get.offNamed(AppRoutes.verifyPhoneNumberScreen, arguments: arg);
     // try {
    //   change(null, status: RxStatus.loading());
    //
    //   ApiClient.sendOtp(txtPhoneController.text).then((result) {
    //     print(result.statusCode);
    //     if (result.statusCode == 204) {
    //        Get.offNamed(AppRoutes.verifyPhoneNumberScreen);
    //     } else {
    //       final jsonResult = jsonDecode(result.body);
    //       String errorMessage = jsonResult["Message"];
    //       Get.defaultDialog(title: "Send otp Failed!", middleText: errorMessage);
    //     }
    //   });
    // } catch (error) {
    //   Get.defaultDialog(title: "Send otp  Error!", middleText: error.toString());
    //  } finally {
    //    Future.delayed(const Duration(milliseconds: 1500), () {
    //     change(null, status: RxStatus.success());
    //   });
    // }
  }

}