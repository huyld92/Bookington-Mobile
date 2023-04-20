// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/notification_model.dart';

import '../../../data/apiClient/api_client.dart';

class NotificationController extends GetxController
    with StateMixin, ScrollMixin {
  RxList<NotificationModel> listNotificationModel = <NotificationModel>[].obs;
  int pageNumber = 1;
  int totalCount = 0;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    await queryNotifications(pageNumber);
  }

  Future<void> queryNotifications(int pageNumber) async {
    try {
      if (pageNumber == 1) {
        change(null, status: RxStatus.loading());
      } else {
        change(null, status: RxStatus.loadingMore());
      }
      String userID = PrefUtils.getString("userID") ?? "null";
      int maxPageSize = 8;
      await ApiClient.queryNotifications(userID, pageNumber, maxPageSize)
          .then((result) {
        if (result.statusCode == 200) {
          var jsonResult = jsonDecode(result.body);
          if (totalCount == 0) {
            listNotificationModel.clear();
          } else {
            if (pageNumber == 1) {
              listNotificationModel.value =
                  NotificationModel.listFromJson(jsonResult["result"]);
            } else {
              listNotificationModel
                  .addAll(NotificationModel.listFromJson(jsonResult["result"]));
            }
          }
          totalCount = jsonResult["pagination"]["totalCount"];

          listNotificationModel.refresh();
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "NotificationController error at queryNotifications: ${result.statusCode}");
        }
      });
    } on Exception catch (e) {
      Logger.log(
          "NotificationController error at queryNotifications: ${e.toString()}");
    } finally {
      if (listNotificationModel.isNotEmpty) {
        change(null, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }
  }

  void logout() async {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  getBack() {
    Get.back(result: "notify screen back");
  }

  void readNotification(int index) {
    listNotificationModel[index].isRead = true;
    listNotificationModel.refresh();
  }

  @override
  Future<void> onEndScroll() async {
    if (listNotificationModel.length < totalCount) {
      pageNumber++;
      await queryNotifications(pageNumber);
    }
  }

  @override
  Future<void> onTopScroll() async {
    print('pageNumber = $pageNumber');
  }
}
