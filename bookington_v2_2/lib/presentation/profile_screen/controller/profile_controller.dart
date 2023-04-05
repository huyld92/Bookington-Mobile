import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/report_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/models/profile_model.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController with StateMixin {
  late Rx<ProfileModel> profileModelObj;
  RxString balance = "".obs;

  @override
  void onInit() {
    loadProfile();
    super.onInit();
  }

  Future<void> loadProfile() async {
    if (PrefUtils.getAccessToken() == null) {
      Get.toNamed(AppRoutes.loginScreen);
    } else {
      String? fullName = PrefUtils.getString("fullName");
      String? phoneNumber = PrefUtils.getString("phoneNumber");
      profileModelObj = ProfileModel(fullName!, phoneNumber!).obs;
      await getBalance();
     }
  }

  Future<void> getBalance() async {
    try {
      change(null, status: RxStatus.loading());

      await ApiClient.getBalance().then(
        (result) {
          print('getBalance statusCode: ${result.statusCode}');
          if (result.statusCode == 200) {
            var jsonResult = jsonDecode(result.body);
            final formatCurrency = NumberFormat("#,###");
            balance.value =
                formatCurrency.format(jsonResult["result"]["balance"] ?? 0.0);
           } else if (result.statusCode == 401 || result.statusCode == 403) {
            ProfileController profileController = Get.find();
            Map<String, bool> arg = {"timeOut": true};
            profileController.logout(arg);
          } else {
            print("getBalance:${result.headers}");
          }
        },
      );
    } catch (e) {
      print(e.toString());
    } finally{
      change(null, status: RxStatus.success());
    }
  }

  Future<void> logout(Map<String, bool>? arg) async {
    PrefUtils.clearPreferencesData();

    if (arg != null) {
      Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
    } else {
      Get.offAllNamed(AppRoutes.loginScreen);
    }
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

  void walletScreen() {
    Get.toNamed(AppRoutes.walletScreen);
  }

  void changePassword() {
    Get.toNamed(AppRoutes.changePasswordScreen);
  }

  void bookingHistory() {
    Get.toNamed(AppRoutes.historyBookingScreen);
  }

  void myMatch() {
    Get.toNamed(AppRoutes.myMatchScreen);
  }

  void changeAccount() {
    Get.toNamed(AppRoutes.changeAccountScreen);
  }

  void reportScreen() {
    Get.toNamed(AppRoutes.reportScreen);

  }
}
