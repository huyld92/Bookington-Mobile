import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/notification_model.dart';

class NotificationController extends GetxController {
  RxList<NotificationModel> listNotificationModel = <NotificationModel>[].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() {
    queryNotifications();
  }

  queryNotifications() {
    Map<String, dynamic> arg = Get.arguments;
    listNotificationModel.value = arg["listNotification"];
    print('$arg["listNotification"]');
  }

  getBack() {
    Get.back(result: "notify screen back");
  }

  void readNotification(int index) {
    listNotificationModel[index].isRead = true;
    listNotificationModel.refresh();
  }
}
