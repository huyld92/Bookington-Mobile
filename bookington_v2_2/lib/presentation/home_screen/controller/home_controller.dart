import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/home_screen/models/home_model.dart';
import 'package:bookington_v2_2/core/utils/pref_utils.dart';
import 'package:bookington_v2_2/presentation/search_page/models/search_model.dart';

class HomeController extends GetxController {
  late Rx<HomeModel> homeModelObj;

  @override
  void onInit() async {
    checkLogin();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void goRecommendScreen() {
    Get.toNamed(AppRoutes.recommendScreen);
  }

  void goCourtDetails() {
    Get.toNamed(AppRoutes.courtDetailsScreen);
  }

  void checkLogin() {

    if (PrefUtils.getAccessToken() == null) {
      Get.toNamed(AppRoutes.loginScreen);
    } else {
      String? fullName = PrefUtils.getString("fullName") ?? "aaaaa";
      print('fulen: ' +fullName);
      homeModelObj = HomeModel(fullName).obs;
    }
  }
}
