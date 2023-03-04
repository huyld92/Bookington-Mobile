import 'package:bookington_v2_2/core/app_export.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
        const Duration(milliseconds: 2000), () => checkUserIsLogged());
  }

  void checkUserIsLogged() async {
     if (PrefUtils.getAccessToken() != null) {
      Get.offNamed(AppRoutes.homeScreen);
    } else {
      Get.offNamed(AppRoutes.loginScreen);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
