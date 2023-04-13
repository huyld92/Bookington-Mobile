
import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/court_model.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/models/court_details_model.dart';

class CourtDetailsController extends GetxController with StateMixin {
  Rx<CourtDetailsModel> courtDetailsModelObj = CourtDetailsModel.empty().obs;

  Rx<int> silderIndex = 2.obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() {
    try {
      Map<String, String> arg = Get.arguments;
      if (arg["courtId"] != null) {
        getCourtDetails(arg["courtId"]!);
        print('courtId: ${arg["courtId"]}');
      }
    } on Exception {
      getBack();
    }
  }

  getCourtDetails(String id) async {
    change(null, status: RxStatus.loading());

    try {
      await ApiClient.getCourtDetails(id).then((result) {
        print('status court details: ${result.statusCode}');

        if (result.statusCode == 200) {
          CourtModel court =
              CourtModel.fromJson(jsonDecode(result.body)["result"]);
          courtDetailsModelObj.value.id = court.id;
          courtDetailsModelObj.value.name = court.name;
          courtDetailsModelObj.value.ownerPhoneNumber = court.phone;
          courtDetailsModelObj.value.districtName = court.districtName;
          courtDetailsModelObj.value.address = court.address;
          courtDetailsModelObj.value.moneyPerHour = court.moneyPerHour;
          courtDetailsModelObj.value.numberOfSubCourt = court.numberOfSubCourt;
          courtDetailsModelObj.value.numberOfReview = court.numberOfReview;
          courtDetailsModelObj.value.openAt = court.openAt;
          courtDetailsModelObj.value.closeAt = court.closeAt;
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "CourtDetailsController error at getCourtDetails: ${result.statusCode}");
        }
      });
    } catch (e) {
      Logger.log(
          "CourtDetailsController error at getCourtDetails: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  void logout() {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }
  void chooseCourtScreen() {
    Map<String, String> arg = Get.arguments;
    Get.toNamed(AppRoutes.chooseCourtScreen, arguments: arg);
  }

  getBack() {
    Get.back();
  }

  void favorite() {}
}
