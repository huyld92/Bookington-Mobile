import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/report_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/models/profile_model.dart';

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

  Future<void> logout() async {
    PrefUtils.clearPreferencesData();
    print('logout');
    Get.toNamed(AppRoutes.loginScreen);
  }

  Future<void> editProfileScreen() async {
    Get.toNamed(AppRoutes.editProfileScreen);
  }

  Future<void> sendReport() async {
    String reportCourtURL = "/bookington/reports/courtreports";
    late String _refCourt = "f2cfb0d1-5e3a-4012-b8dc-5793e1b4334c";
    late String _content = "aaaaaaaaa";
    ReportModel reportModel = ReportModel.forReport(_refCourt, _content);
    var result = await ApiClient.reportCourt(reportCourtURL, reportModel);
    print(result["result"].toString());
    // Get.toNamed(AppRoutes.editProfileScreen);
  }

  void loadProfile() {
    if (PrefUtils.getAccessToken() == null) {
      Get.toNamed(AppRoutes.loginScreen);
    } else {
      String? _fullName = PrefUtils.getString("fullName");
      String? _phomeNumber =
          PrefUtils.getString("phoneNumber");
      profileModelObj = ProfileModel(_fullName!, _phomeNumber!).obs;
    }
  }
}
