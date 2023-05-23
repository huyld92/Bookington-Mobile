// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/notification_model.dart';
import 'package:intl/intl.dart';

import '../../../data/apiClient/api_client.dart';

class NotificationController extends GetxController
    with StateMixin, ScrollMixin {
  RxList<NotificationModel> listNotificationModel =
      RxList.empty(growable: true);
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
        this.pageNumber = 1;
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
          totalCount = jsonResult["pagination"]["totalCount"];

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
          listNotificationModel
              .sort((a, b) => b.createAt.compareTo(a.createAt));
          listNotificationModel.refresh();
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Logger.log(
              "NotificationController error at queryNotifications: ${result.statusCode}, \n ${result.body}");
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

  Future<void> markAsReadNotification(int index) async {
    try {
      List<String> listMapNotification = List.empty(growable: true);
      if (index < listNotificationModel.length) {
        listNotificationModel[index].isRead = true;
        listMapNotification.add(listNotificationModel[index].id);
        print(listMapNotification[0].toString());
      } else if (index == 99999) {
        listMapNotification =
            listNotificationModel.map((element) => element.id).toList();
        for (var element in listNotificationModel) {
          element.isRead = true;
        }
      }
      listNotificationModel.refresh();
      if (listMapNotification.isNotEmpty) {
        await ApiClient.markAllAsRead(listMapNotification).then((result) {
          print('result.statusCode:${result.statusCode}');
          if (result.statusCode == 204) {
            // var jsonResult = jsonDecode(result.body);
            // print(jsonResult.toString());
          } else if (result.statusCode == 401 || result.statusCode == 403) {
            logout();
          } else {
            Logger.log(
                "NotificationController error at readNotification: ${result.statusCode}, \n ${result.body}");
          }
        });
      }
    } on Exception catch (e) {
      Logger.log(
          "NotificationController error at readNotification: ${e.toString()}");
    }
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
