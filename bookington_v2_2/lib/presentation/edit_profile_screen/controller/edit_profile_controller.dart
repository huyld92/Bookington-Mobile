import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/account_model.dart';
import 'package:bookington_v2_2/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  TextEditingController selecttypeController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController birthdayController = TextEditingController();

  late Rx<EditProfileModel> editProfileModelObj;

  @override
  void onReady() {
    loadProfile();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    selecttypeController.dispose();
    phoneController.dispose();
    fullNameController.dispose();
    birthdayController.dispose();
  }

  void loadProfile() {
    if (PrefUtils.getString("sysToken") == null) {
      Get.toNamed(AppRoutes.loginScreen);
    } else {
      String userID = PrefUtils.getString("userID") ?? "-1";
      print('userID: ' + userID);
      ApiClient.getProfileById(userID).then((result) {
        print(result.statusCode);
        if (result.statusCode == 200) {
          final jsonResult = (jsonDecode(result.body)["result"]);
          print(jsonResult);
          phoneController.text = jsonResult["phone"];
          fullNameController.text = jsonResult["fullName"];
          try {
            birthdayController.text =
                DateFormat("dd/MM/yyyy").format(jsonResult["dateOfBirth"]);
          } catch (error) {
            birthdayController.text = "Select date";
          }
        }
      });
    }
  }

  getBack() {
    Get.back(id: 5);
  }
}
