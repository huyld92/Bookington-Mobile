import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RegistrationPhoneController extends GetxController with StateMixin {
  TextEditingController txtPhoneController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();

  TextEditingController txtPasswordConfirm = TextEditingController();

  Rx<bool> isShowPassword = false.obs;
  Rx<bool> isShowConfirm = false.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.success());

    super.onInit();
  }

  @override
  void onClose() {
    txtPasswordController.clear();
    txtPasswordConfirm.clear();
    super.onClose();
  }

  Future<void> registrationWithPhone() async {
    try {
      change(null, status: RxStatus.loading());
      await ApiClient.register(txtPhoneController.text,
              txtPasswordController.text, txtPhoneController.text)
          .then((result) {
        if (result.statusCode == 201) {
          PrefUtils.setString("rePhoneNumber", txtPhoneController.text);
          Map<String, String> arg = {
            "rePhoneNumber": txtPhoneController.text,
            "isResetPassword": "false"
          };
          Get.snackbar(
            'Send otp',
            "Send otp successful",
            colorText: ColorConstant.black900,
            duration: const Duration(seconds: 2),
            backgroundColor: ColorConstant.whiteA700,
            icon: CustomImageView(
                width: 16, height: 16, svgPath: ImageConstant.imgNotify),
          );
          Get.toNamed(AppRoutes.verifyPhoneNumberScreen, arguments: arg);
        } else if (result.statusCode == 400) {
          String message = jsonDecode(result.body)["Message"];
          if (message.contains("Account Is Not Verify")) {
            Get.defaultDialog(
              title: "Register Failed!",
              barrierDismissible: false,
              middleText:
                  "Account is not verify!\n Are you sure you want to cancel order?",
              cancel: CustomButton(
                padding: ButtonPadding.PaddingAll0,
                height: getVerticalSize(40),
                width: getHorizontalSize(80),
                fontStyle: ButtonFontStyle.ManropeBold14WhiteA700,
                variant: ButtonVariant.FillGray500,
                text: "lbl_no".tr,
                onTap: () {
                  Get.back();
                },
              ),
              confirm: CustomButton(
                padding: ButtonPadding.PaddingAll0,
                height: getVerticalSize(40),
                width: getHorizontalSize(80),
                fontStyle: ButtonFontStyle.ManropeBold14WhiteA700,
                text: "lbl_yes".tr,
                onTap: () async {
                  Get.back();
                  await sendOtp();
                  PrefUtils.setString("rePhoneNumber", txtPhoneController.text);

                  Map<String, String> arg = {
                    "rePhoneNumber": txtPhoneController.text,
                    "isResetPassword": "false"
                  };
                  Get.toNamed(AppRoutes.verifyPhoneNumberScreen,
                      arguments: arg);
                },
              ),
            );
          } else {
            Get.defaultDialog(
                title: "Register Failed!",
                middleText: jsonDecode(result.body)["Message"]);
          }
        } else {
          Get.defaultDialog(
              title: "Register Failed!",
              middleText: jsonDecode(result.body)["Message"]);
        }
      });
    } catch (error) {
      Logger.log(
          "RegistrationPhoneController ERROR at registrationWithPhone: ${error.toString()}");
      Get.defaultDialog(
          title: "Register Error!", middleText: "Please register later");
    } finally {
      change(null, status: RxStatus.success());
    }
    // Map<String, String> arg = {
    //         "rePhoneNumber": txtPhoneController.text,
    //         "isResetPassword": "false"
    //       };
    // Get.toNamed(AppRoutes.verifyPhoneNumberScreen, arguments: arg);
  }

  loginScreen() {
    Get.offNamed(AppRoutes.loginScreen);
  }

  Future<void> sendOtp() async {
    try {
      change(null, status: RxStatus.loading());
      String? phoneNumber = txtPhoneController.text;
      await ApiClient.resendOtp(phoneNumber).then((result) {
        print('result.statusCode: ${result.statusCode}');
        if (result.statusCode == 204) {
          //success
          Get.snackbar(
            'Send otp',
            "Send otp successful",
            colorText: ColorConstant.black900,
            duration: const Duration(seconds: 1),
            backgroundColor: ColorConstant.whiteA700,
            icon: CustomImageView(
                width: 16, height: 16, svgPath: ImageConstant.imgNotify),
          );
        } else {
          Get.defaultDialog(
              title: "Send otp failed!",
              middleText: jsonDecode(result.body)["Message"]);
        }
      });
    } catch (e) {
      Logger.log(
          "RegistrationPhoneController ERROR at sendOtp: ${e.toString()}");
      Get.defaultDialog(
          title: "Send otp error!", middleText: "Please register later");
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
