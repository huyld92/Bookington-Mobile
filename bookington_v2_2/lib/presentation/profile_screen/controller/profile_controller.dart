import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/map_utils.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/apiClient/signalR_hub.dart';
import 'package:bookington_v2_2/data/models/report_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/models/profile_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:signalr_flutter/signalr_flutter.dart';

class ProfileController extends GetxController {
  late Rx<ProfileModel> profileModelObj;
  RxString balance = "".obs;

  @override
  void onInit() {
    loadProfile();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void loadProfile() {
    if (PrefUtils.getAccessToken() == null) {
      Get.toNamed(AppRoutes.loginScreen);
    } else {
      String? fullName = PrefUtils.getString("fullName");
      String? phoneNumber = PrefUtils.getString("phoneNumber");
      profileModelObj = ProfileModel(fullName!, phoneNumber!).obs;
      getBalance();
    }
  }

  Future<void> getBalance() async {
    try {
      ApiClient.getBalance().then((result) {
        print('statusCode: ${result.statusCode}');
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          final formatCurrency = NumberFormat("#,###");
          balance.value =
              formatCurrency.format(jsonResult["result"]["balance"]);
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          ProfileController profileController = Get.find();
          Map<String, bool> arg = {"timeOut": true};
          profileController.logout(arg);
        } else {
          print(result.headers);
        }
      });
    } catch (e) {
      print(e.toString());
      ProfileController profileController = Get.find();
      Map<String, bool> arg = {"timeOut": true};
      profileController.logout(arg);
    }
  }

  Future<void> logout(Map<String, bool>? arg) async {
    PrefUtils.clearPreferencesData();
    print('logout');
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

  void test() {
    MapUtil.getCurrentPosition();
    // SignalRHub.test();
    // initPlatformState();
    // connect();
  }

  Future<void> initPlatformState() async {
    String? sysToken = PrefUtils.getAccessToken();
    Map<String, String> headers = {
      "Authorization":
          "Bearer $sysToken"
    };
    SignalR signalR =
    SignalR('http://127.0.0.1:7179', "/notificationHub?UserId=e53ae5d8-6ae1-403f-b0f7-e342db54026b",
        hubMethods: ["ReceiveNotifications"],
        headers: headers,
        statusChangeCallback: (status) => print("status: $status"),
        hubCallback: (methodName, message) =>
            print('MethodName = $methodName, Message = $message'));
    print(signalR.baseUrl + signalR.hubName);

    await signalR.connect();
  }



// void test() {
//   String userID = "e53ae5d8-6ae1-403f-b0f7-e342db54026b";
//   int pageNumber=1;
//   int maxPageSize=10;
//    ApiClient.queryNotifications(userID,pageNumber,maxPageSize)
//       .then((result) {
//     print('statusCode: ${result.statusCode}');
//     if (result.statusCode == 200) {
//       var jsonResult = jsonDecode(result.body);
//       List<NotificationModel> listNotify =
//       NotificationModel.listFromJson(jsonResult["result"]);
//       print('BookingModel: $listNotify');
//     } else {
//       print(result.headers);
//     }
//   });
//  }
}
