import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/notification_model.dart';
import 'package:bookington_v2_2/data/models/report_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/models/profile_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

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
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
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
    _getCurrentPosition();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("title",
          'Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("title", 'Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("title",
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      print("location: ${position.toString()}");

      _getAddressFromLatLng(position);
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position currentPosition) async {
    await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      String currentAddress = 'street: ${place.street}, subAdministrativeArea: ${place.subAdministrativeArea},administrativeArea: ${place.administrativeArea}, ${place.country}';
      print(currentAddress);
    }).catchError((e) {
      print(e);
    });
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
