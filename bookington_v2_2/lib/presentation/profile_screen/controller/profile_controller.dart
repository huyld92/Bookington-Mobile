// ignore_for_file: avoid_print, unused_local_variable

import 'dart:convert';
import 'dart:typed_data';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/account_model.dart';
import 'package:bookington_v2_2/data/models/report_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/models/profile_model.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController with StateMixin {
  late Rx<ProfileModel> profileModelObj = ProfileModel.empty().obs;
  Rx<Uint8List> bytesImage = Uint8List(0).obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    await getProfile();
    await getBalance();
    bytesImage.value = const Base64Decoder().convert(profileModelObj.value.accountModel.imgBase);

  }

  Future<void> getProfile() async {
    change(null, status: RxStatus.loading());
    try {
      if (PrefUtils.getString("sysToken") == null) {
        Get.offAllNamed(AppRoutes.loginScreen);
      } else {
        String sysToken = PrefUtils.getAccessToken() ?? "-1";
        await ApiClient.getProfile(sysToken).then(
          (result) {
            if (result.statusCode == 200) {
              final jsonResult = (jsonDecode(result.body)["result"]);
              AccountModel accountModel = AccountModel.fromJson(jsonResult);
              profileModelObj.value.accountModel = accountModel;
            } else if (result.statusCode == 401 || result.statusCode == 403) {
              logout(null);
            } else {
              Logger.log(
                  "ProfileController error at getProfile: ${result.statusCode}");
            }
          },
        );
      }
    } on Exception catch (e) {
      Logger.log("ProfileController error at getProfile: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  Future<void> getBalance() async {
    try {
      change(null, status: RxStatus.loading());

      await ApiClient.getBalance().then(
        (result) {
          if (result.statusCode == 200) {
            var jsonResult = jsonDecode(result.body);
            final formatCurrency = NumberFormat("#,###");

            profileModelObj.value.balance =
                formatCurrency.format(jsonResult["result"]["balance"]) ?? "0.0";
          } else if (result.statusCode == 401 || result.statusCode == 403) {
            Map<String, bool> arg = {"timeOut": true};
            logout(arg);
          } else {
            Logger.log(
                "ProfileController error at getBalance: ${result.statusCode}");
          }
        },
      );
    } catch (e) {
      Logger.log("ProfileController error at getBalance: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  void logout(Map<String, bool>? arg) async {
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
        loadData();
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
