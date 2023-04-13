import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:bookington_v2_2/presentation/home_screen/controller/home_controller.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController with StateMixin {
  TextEditingController phoneController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var selectedDate = DateFormat("dd/MM/yyyy").parse("01/01/1900").obs;

  late Rx<EditProfileModel> editProfileModelObj;

  @override
  void onReady() {
    loadProfile();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    phoneController.dispose();
    fullNameController.dispose();
    descriptionController.dispose();
  }

  Future<void> loadProfile() async {
    change(null, status: RxStatus.loading());
    try {
      if (PrefUtils.getString("sysToken") == null) {
        Get.offNamed(AppRoutes.loginScreen);
      } else {
        String sysToken = PrefUtils.getAccessToken() ?? "-1";
        await ApiClient.getProfile(sysToken).then(
          (result) {
            if (result.statusCode == 200) {
              final jsonResult = (jsonDecode(result.body)["result"]);
              phoneController.text = jsonResult["phone"];
              fullNameController.text = jsonResult["fullName"];
              try {
                var dateValue = DateFormat("yyyy-MM-dd")
                    .parseUTC(jsonResult["dateOfBirth"])
                    .toLocal()
                    .toString();
                selectedDate.value = DateFormat("yyyy-MM-dd").parse(dateValue);
              } catch (error) {
                Logger.log(
                    "EditProfileController error at loadProfile: ${error.toString()}");
                selectedDate = DateFormat("dd/MM/yyyy").parse("01/01/1900").obs;
              }
            } else if (result.statusCode == 401 || result.statusCode == 403) {
              logout();
            } else {
              Logger.log(
                  "EditProfileController error at loadProfile: ${result.statusCode}");
            }
          },
        );
      }
    } on Exception catch (e) {
      Logger.log("EditProfileController error at loadProfile: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  Future<void> logout() async {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  getBack() {
    Get.back(result: "Back edit profile");
  }

  presentDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(0010),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendar,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Date',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  Future<void> updateProfile() async {
    try {
      if (PrefUtils.getString("userID") == null) {
        Get.offNamed(AppRoutes.loginScreen);
      } else {
        String userID = PrefUtils.getString("userID") ?? "-1";
        String fullName = fullNameController.text;

        String date = selectedDate.value.toString();
         await ApiClient.updateProfile(userID, fullName, date).then(
          (result) {
            if (result.statusCode == 200) {
              final jsonResult = (jsonDecode(result.body)["result"]);
              fullNameController.text = jsonResult["fullName"];
              HomeController homeController = Get.find();
              homeController.homeModelObj.value.accountModel.fullName =
                  fullName;
              homeController.homeModelObj.refresh();
              Get.snackbar(
                'Edit profile',
                "Edit profile successful",
                colorText: ColorConstant.black900,
                duration: const Duration(seconds: 1),
                backgroundColor: ColorConstant.whiteA700,
                icon: CustomImageView(
                    width: 16, height: 16, svgPath: ImageConstant.imgNotify),
              );
            } else if (result.statusCode == 401 || result.statusCode == 403) {
              ProfileController profileController = Get.find();
              Map<String, bool> arg = {"timeOut": true};
              profileController.logout(arg);
            } else {
              Logger.log(
                  "EditProfileController error at updateProfile: ${result.statusCode}");

              Get.snackbar(
                'Edit profile',
                "Edit profile failed",
                colorText: ColorConstant.black900,
                 backgroundColor: ColorConstant.whiteA700,
                icon: CustomImageView(
                    width: 16, height: 16, svgPath: ImageConstant.imgNotify),
              );
            }
          },
        );
      }
    } on Exception catch (e) {
      Logger.log(
          "EditProfileController error at updateProfile: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
