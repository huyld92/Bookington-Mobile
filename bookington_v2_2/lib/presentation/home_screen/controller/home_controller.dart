import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/home_screen/models/home_model.dart';

class HomeController extends GetxController  with StateMixin {
  late Rx<HomeModel> homeModelObj;

  @override
  void onInit() async {
    print('homeee controller init');

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
    print("go Recommend");
    // Get.toNamed(AppRoutes.recommendScreen);
  }

  void goCourtDetails() {
    Get.toNamed(AppRoutes.courtDetailsScreen);
  }

  void checkLogin() {
    change(null, status: RxStatus.loading());

    if (PrefUtils.getAccessToken() == null) {
      Get.toNamed(AppRoutes.loginScreen);
    } else {
      String? fullName = PrefUtils.getString("fullName") ?? "aaaaa";

      homeModelObj = HomeModel(fullName).obs;
    }
    change(null, status: RxStatus.success());

  }

  void notificationScreen() {
    Get.toNamed(AppRoutes.notificationScreen);
  }
}
