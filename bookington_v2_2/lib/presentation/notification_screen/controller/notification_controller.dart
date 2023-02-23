import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/notification_screen/models/notification_model.dart';

class NotificationController extends GetxController {
  Rx<NotificationModel> notificationModelObj = NotificationModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // getBack() {
  //   Get.back();
  // }
}
