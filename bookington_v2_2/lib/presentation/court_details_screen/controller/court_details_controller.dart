import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/court_model.dart';
import 'package:bookington_v2_2/presentation/court_details_screen/models/court_details_model.dart';
import 'package:intl/intl.dart';

class CourtDetailsController extends GetxController {
  Rx<CourtDetailsModel> courtDetailsModelObj = CourtDetailsModel().obs;

  late CourtModel courtModel = CourtModel("1", "Phu Tho", 4.9,
      "Quận 11", "Thành Phố Hồ Chí Minh", 100000, 10,
      DateFormat("kk:mm").parse("09:00"), DateFormat("kk:mm").parse("21:00"));

  // RxString radioGroup = "".obs;

  Rx<int> silderIndex = 2.obs;


  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData(){
    // Map<String, String?> params = Get.parameters;
    if(PrefUtils.getString("courtId") != null){
      getCourtDetails(PrefUtils.getString("courtId")!);
      print('id: ${PrefUtils.getString("courtId") }');
    } else{
      print('NUlll');
    }
  }
  getCourtDetails(String id){
    ApiClient.getCourtDetails(id).then((result) {
      print('status courtdetails: ' + result.statusCode.toString());

      if (result.statusCode == 200) {
        courtModel =
            CourtModel.fromJson(jsonDecode(result.body)["result"]);

        print('court model: ${courtModel.toString()}');
      } else{
        print('ERRRRRRRRR');
      }
    });
    print('AAAAAAAAAA');
    if(courtModel == null){
      courtModel = CourtModel("1", "Phu Tho", 4.9,
          "Quận 11", "Thành Phố Hồ Chí Minh", 100000, 10,
          DateFormat("kk:mm").parse("09:00"), DateFormat("kk:mm").parse("21:00"));
    }

  }
  void chooseCourtScreen() {
    Get.toNamed(AppRoutes.chooseCourtScreen);
  }

  onTapArrowleft() {
    Get.back( );
    print("back Court detail");
  }
}
