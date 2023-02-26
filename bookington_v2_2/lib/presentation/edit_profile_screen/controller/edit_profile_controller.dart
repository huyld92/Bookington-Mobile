import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  TextEditingController phoneController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  var selectedDate = DateTime.now().obs;

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
      print(sysToken);
      ApiClient.getProfile(sysToken).then(
        (result) {
          print(result.statusCode);
          if (result.statusCode == 200) {
            final jsonResult = (jsonDecode(result.body)["result"]);
            print("edit: " + jsonResult);
            phoneController.text = jsonResult["phone"];
            fullNameController.text = jsonResult["fullName"];
            try {
              selectedDate =
                  DateFormat("dd/MM/yyyy").parse(jsonResult["dateOfBirth"]).obs;
            } catch (error) {
              selectedDate = DateFormat("dd/MM/yyyy").parse("1900-01-01").obs;
            }
          } else {
             print('headers: ${result.headers}');
          }
        },
      );
    }
  }

  getBack() {
    Get.back();
  }

  presentDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
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
      print("Date" + pickedDate.toString());
    }
  }
}
