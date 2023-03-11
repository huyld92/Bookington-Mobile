import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:bookington_v2_2/presentation/home_screen/controller/home_controller.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  TextEditingController phoneController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

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
  }

  void loadProfile() {
    if (PrefUtils.getString("sysToken") == null) {
      Get.offNamed(AppRoutes.loginScreen);
    } else {
      String sysToken = PrefUtils.getAccessToken() ?? "-1";
      ApiClient.getProfile(sysToken).then(
        (result) {
          print(result.statusCode);
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
              print(error.toString());
              selectedDate = DateFormat("dd/MM/yyyy").parse("01/01/1900").obs;
            }
          } else if (result.statusCode == 401 || result.statusCode == 403) {
            ProfileController profileController = Get.find();
            profileController.logout();
          } else {
            print('EDIT PROFILE headers: ${result.headers}');
          }
        },
      );
    }
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
      print("Date picked: " + pickedDate.toString());
    }
  }

  void updateProfile() {
    if (PrefUtils.getString("userID") == null) {
      Get.offNamed(AppRoutes.loginScreen);
    } else {
      String userID = PrefUtils.getString("userID") ?? "-1";
      String fullName = fullNameController.text;

      String date = selectedDate.value.toString();
      ApiClient.updateProfile(userID, fullName, date).then(
        (result) {
          print(result.statusCode);
          if (result.statusCode == 200) {
            final jsonResult = (jsonDecode(result.body)["result"]);
            print("edit: $jsonResult");
            fullNameController.text = jsonResult["fullName"];
            PrefUtils.setString("fullName", fullNameController.text);
            HomeController homeController = Get.find();
            homeController.homeModelObj.value.fullName = fullName;
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
            profileController.logout();
          } else {
            print('${result}');
            Get.snackbar(
              'Edit profile',
              "Edit profile failed",
              colorText: ColorConstant.black900,
              // duration: const Duration(seconds: 1),
              backgroundColor: ColorConstant.whiteA700,
              icon: CustomImageView(
                  width: 16, height: 16, svgPath: ImageConstant.imgNotify),
            );
          }
        },
      );
    }
  }
}
