import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/court_model.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/models/court_details_model.dart';
import 'package:bookington_v2_2/presentation/search_page/models/search_model.dart';
import 'package:intl/intl.dart';

class CourtDetailsController extends GetxController {
  Rx<CourtDetailsModel> courtDetailsModelObj = CourtDetailsModel(
    "1",
    "Phu Tho",
    4.9,
    "Quận 11",
    "123, Ly Thuong Kiet",
    100000,
    10,
    DateFormat("kk:mm").parse("09:00"),
    DateFormat("kk:mm").parse("21:00"),
  ).obs;

  // RxString radioGroup = "".obs;

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
    } on Exception catch (e) {
      getBack();
    }
  }

  // getCourtDetails(String id) {
  //   ApiClient.getCourtDetails(id).then((result) {
  //     print('status courtdetails: ' + result.statusCode.toString());
  //
  //     if (result.statusCode == 200) {
  //       courtModel = SearchModel.fromJson(jsonDecode(result.body)["result"]);
  //
  //       print('court model: ${courtModel.toString()}');
  //     } else {
  //       print('ERRRRRRRRR');
  //     }
  //   });
  //   print('AAAAAAAAAA');
  //   if (courtModel == null) {
  //     courtModel = SearchModel(
  //         "1",
  //         "1",
  //         4.8,
  //         "Phu Tho",
  //         "Quận 11",
  //         10000,
  //         11,
  //         DateFormat("kk:mm").parse("09:00"),
  //         DateFormat("kk:mm").parse("21:00"));
  //   }
  // }

  getCourtDetails(String id) {
    ApiClient.getCourtDetails(id).then((result) {
      print('status courtdetails: ' + result.statusCode.toString());

      if (result.statusCode == 200) {
        CourtModel court =
            CourtModel.fromJson(jsonDecode(result.body)["result"]);
        courtDetailsModelObj.value.id = court.id;
        courtDetailsModelObj.value.name = court.name;
        courtDetailsModelObj.value.districtName = court.districtId;
        courtDetailsModelObj.value.address = court.address;
        courtDetailsModelObj.value.openAt = court.openAt;
        courtDetailsModelObj.value.closeAt = court.closeAt;
        print('court model: ${courtDetailsModelObj.value.toString()}');
      } else {
        print('ERRRRRRRRR');
      }
    });
  }

  void chooseCourtScreen() {
    Map<String, String> arg = Get.arguments;
    Get.toNamed(AppRoutes.chooseCourtScreen, arguments: arg);
  }

  getBack() {
    PrefUtils.remove("courtId");
    Get.back();
    print("back from Court detail");
  }
}
