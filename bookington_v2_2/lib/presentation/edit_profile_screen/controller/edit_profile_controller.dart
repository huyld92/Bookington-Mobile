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
      String? userID = PrefUtils.getString("userID");
      String? fullName = PrefUtils.getString("fullName");
      String? phomeNumber =
      PrefUtils.getString("phoneNumber");
      AccountModel accountModel = AccountModel(userID!, "1", phomeNumber!, "", fullName!, DateFormat("dd/MM/yyyy").parse("12/1/2000"),  DateFormat("dd/MM/yyyy").parse("12/1/2000"), true);
      editProfileModelObj = EditProfileModel(accountModel).obs;
      phoneController.text = fullName;
      fullNameController.text = accountModel.fullName;
      birthdayController.text = accountModel.dateOfBirth.toString();

    }
  }
}

