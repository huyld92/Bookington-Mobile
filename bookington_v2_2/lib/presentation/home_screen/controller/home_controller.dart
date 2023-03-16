import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/notification_model.dart';
import 'package:bookington_v2_2/presentation/home_screen/models/home_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';

class HomeController extends GetxController with StateMixin {
  late Rx<HomeModel> homeModelObj = HomeModel().obs;
  late RxInt totalUnread = 0.obs;

  @override
  void onInit() async {
    loadData();
    super.onInit();
  }

  loadData() {
    change(null, status: RxStatus.loading());

    checkLogin();

    queryNotifications();
    change(null, status: RxStatus.success());
  }

  queryNotifications() {
    String userID = PrefUtils.getString("userID") ?? "null";
    int pageNumber = 1;
    int maxPageSize = 10;
    ApiClient.queryNotifications(userID, pageNumber, maxPageSize)
        .then((result) {
      print('statusCode: ${result.statusCode}');
      if (result.statusCode == 200) {
        var jsonResult = jsonDecode(result.body);
        List<NotificationModel> listNotification =
            NotificationModel.listFromJson(jsonResult["result"]);

        homeModelObj.value.listNotification = listNotification;
        totalUnread.value =
            listNotification.where((notify) => notify.isRead == false).length;
      } else if (result.statusCode == 401 || result.statusCode == 403) {
        ProfileController profileController = Get.find();
        Map<String, bool> arg = {"timeOut": true};
        profileController.logout(arg);
      } else {
        print(result.headers);
      }
    });
  }

  void goRecommendScreen() {
    print("go Recommend");
    // Get.toNamed(AppRoutes.recommendScreen);
  }

  void goCourtDetails() {
    // Get.toNamed(AppRoutes.courtDetailsScreen);
  }

  void checkLogin() {
    change(null, status: RxStatus.loading());

    if (PrefUtils.getAccessToken() == null) {
      Get.toNamed(AppRoutes.loginScreen);
    } else {
      String? fullName = PrefUtils.getString("fullName") ?? "null";
      homeModelObj.value.fullName = fullName;
    }
    change(null, status: RxStatus.success());
  }

  void notificationScreen() {
    Map<String, dynamic> arg = {
      "listNotification": homeModelObj.value.listNotification
    };
    Get.toNamed(AppRoutes.notificationScreen, arguments: arg)?.then((value) {
      loadData();
    });
  }
}
