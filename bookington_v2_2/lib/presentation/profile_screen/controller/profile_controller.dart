import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/notification_model.dart';
import 'package:bookington_v2_2/data/models/report_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/models/profile_model.dart';

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
      // getBalance();
    }
  }

  Future<void> getBalance() async {
    // PrefUtils.clearPreferencesData();
    // print('logout');
    // Get.offAllNamed(AppRoutes.loginScreen);
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
    Get.toNamed(AppRoutes.favouriteScreen);
  }

  void test() {
    String userID = "e53ae5d8-6ae1-403f-b0f7-e342db54026b";
    int pageNumber=1;
    int maxPageSize=10;
     ApiClient.queryNotifications(userID,pageNumber,maxPageSize)
        .then((result) {
      print('statusCode: ${result.statusCode}');
      if (result.statusCode == 200) {
        var jsonResult = jsonDecode(result.body);
        List<NotificationModel> listNotify =
        NotificationModel.listFromJson(jsonResult["result"]);
        print('BookingModel: $listNotify');
      } else {
        print(result.headers);
      }
    });

   }
}
