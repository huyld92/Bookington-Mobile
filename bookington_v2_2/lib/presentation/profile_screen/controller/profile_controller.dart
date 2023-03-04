import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/report_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/models/profile_model.dart';
import 'package:intl/intl.dart';

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

  Future<void> logout() async {
    PrefUtils.clearPreferencesData();
    print('logout');
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  Future<void> editProfileScreen() async {
    Get.toNamed(AppRoutes.editProfileScreen)?.then((value) {
      profileModelObj.update((profile) {
        profile?.fullName = PrefUtils.getString("fullName")!;
      });
    });
  }

  Future<void> sendReport() async {
    String reportCourtURL = "/bookington/reports/courtreports";
    late String refCourt = "f2cfb0d1-5e3a-4012-b8dc-5793e1b4334c";
    late String content = "aaaaaaaaa";
    ReportModel reportModel = ReportModel.forReport(refCourt, content);
    var result = await ApiClient.reportCourt(reportCourtURL, reportModel);
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

  void transactionScreen() {
    Get.toNamed(AppRoutes.transactionScreen);
  }

  void test() {
    // String str = '2022-01-05T00:00:00';
    ApiClient.getTransactionHistory().then((result) {
      print('statusCode: ${result.statusCode}');
      if(result.statusCode == 200){
        print(jsonDecode(result.body));
      } else{
        print('errror');
      }
    });

  }
}
