import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/report_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/booking_model.dart';

class ProfileController extends GetxController {
  late Rx<ProfileModel> profileModelObj;

  @override
  void onInit() {
    loadProfile();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadProfile() {
    if (PrefUtils.getAccessToken() == null) {
      Get.toNamed(AppRoutes.loginScreen);
    } else {
      String? fullName = PrefUtils.getString("fullName");
      String? phoneNumber = PrefUtils.getString("phoneNumber");
      profileModelObj = ProfileModel(fullName!, phoneNumber!).obs;
    }
  }

  Future<void> logout() async {
    PrefUtils.clearPreferencesData();
    print('logout');
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  Future<void> editProfileScreen() async {
    Get.toNamed(AppRoutes.editProfileScreen)?.then(
      (value) {
        profileModelObj.update(
          (profile) {
            profile?.fullName = PrefUtils.getString("fullName")!;
          },
        );
      },
    );
  }

  Future<void> sendReport() async {
    String reportCourtURL = "/bookington/reports/courtreports";
    late String refCourt = "f2cfb0d1-5e3a-4012-b8dc-5793e1b4334c";
    late String content = "aaaaaaaaa";
    ReportModel reportModel = ReportModel.forReport(refCourt, content);
    var result = await ApiClient.reportCourt(reportCourtURL, reportModel);
  }

  void transactionScreen() {
    Get.toNamed(AppRoutes.transactionScreen);
  }

  void favouriteCourt() {
    Get.toNamed(AppRoutes.transactionScreen);
  }

  void test() {
    List<String> listSlotId = ["4", "3" ];
    String playDate = "2023-03-06";
    Map<String, String> body = {};
    List<Map<String, String>> listSlotBooking = [];
    for (String id in listSlotId) {
      Map<String, String> clone = {"refSlot": id, "playDate": playDate};
      listSlotBooking.add(clone);
    }
    print(listSlotBooking);
    ApiClient.createNewBooking(listSlotBooking)
        .then((result) {
      print('statusCode: ${result.statusCode}');
      if (result.statusCode == 201) {
        var jsonResult = jsonDecode(result.body);
        List<BookingModel> listBooking =
        BookingModel.listFromJson(jsonResult["result"]);
        print('BookingModel: $BookingModel');
        // Map<String,dynamic> arg = {
        //   "listSlotId":listSlotId,
        //   "refOrder":refOrder,
        //   "playDate":playDate.value
        // };
        // Get.toNamed(AppRoutes.paymentScreen,arguments: arg);
      } else {
        print(result.headers);
      }
    });

   }
}
