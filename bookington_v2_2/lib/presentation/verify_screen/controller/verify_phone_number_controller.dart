import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/verify_screen/models/verify_phone_number_model.dart';

import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VerifyPhoneNumberController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;
  String phoneNumber = "";

  Rx<VerifyPhoneNumberModel> verifyPhoneNumberModelObj =
      VerifyPhoneNumberModel().obs;
  RxBool isResetPassword = false.obs;


  Timer? _timer;
  int remainSeconds = 1;
  final time = '00.00'.obs;
  RxBool isResend = false.obs;

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
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    if(_timer!=null){
      _timer!.cancel();
    }
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
    Map<String, String> arg = Get.arguments;

    if (arg != null) {
      phoneNumber = arg["rePhoneNumber"]!.substring(7);
      isResetPassword.value = arg["isResetPassword"] == "true"?true:false;

    }
    _startTimer(90);

  }

  _startTimer(int seconds){
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    isResend.value = true;
    _timer = Timer.periodic(duration, (Timer timer) {
      if(remainSeconds==0){
        time.value = '00.00';
        print('renaub 0');
        isResend.value = false;
        timer.cancel();
      }else{
        int minutes = remainSeconds~/60;
        int seconds = remainSeconds%60;
        time.value = "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainSeconds--;
      }
     });
  }

  void getBack() {
    Get.back();
  }

  Future<void> resendOtp() async {
    _startTimer(90);
     try {
      String? phoneNumber = PrefUtils.getString("rePhoneNumber");
      print("cootp: " + otpController.value.text);

      var response =
          await ApiClient.resendOtp(phoneNumber!);

      if (response.statusCode == 204) {
        //success
        Get.snackbar(
          'Resend otp',
          "Resend otp successful",
          colorText: ColorConstant.black900,
          duration: const Duration(seconds: 1),
          backgroundColor: ColorConstant.whiteA700,
          icon: CustomImageView(
              width: 16, height: 16, svgPath: ImageConstant.imgNotify),
        );
       } else {
        Get.defaultDialog(
            title: "Resend otp failed!",
            middleText: jsonDecode(response.body)["Message"]);
      }
    } catch (error) {
      Get.defaultDialog(
          title: "Resend otp error!", middleText: error.toString());
    }
  }
}
