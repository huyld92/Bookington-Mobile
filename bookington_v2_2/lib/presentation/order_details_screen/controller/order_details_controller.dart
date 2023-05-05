import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/models/order_history_model.dart';

class OrderDetailsController extends GetxController with StateMixin {
  Rx<OrderHistoryModel> orderHistory = OrderHistoryModel.empty().obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    try {
      change(null, status: RxStatus.success());
      Map<String, dynamic>? arg = Get.arguments;
      if (arg != null) {
        orderHistory.value = arg["orderDetails"];
       }
    } on Exception catch (e) {
      Logger.log("OrderDetailsController ERROR at loadData: ${e.toString()}");
    }
  }

  Future<void> cancelOrder() async {
    try {
      change(null, status: RxStatus.loading());

      Get.back();
      String orderId = orderHistory.value.id;
      await ApiClient.cancelOrder(orderId).then((result) {
        if (result.statusCode == 200) {
          orderHistory.value.isCanceled = true;
          Get.snackbar(
            'msg_cancel_order'.tr,
            "Cancel order success!",
            colorText: ColorConstant.black900,
            duration: const Duration(milliseconds: 2500),
            backgroundColor: ColorConstant.whiteA700,
            icon: CustomImageView(
                width: getSize(16),
                height: getSize(16),
                svgPath: ImageConstant.imgNotify),
          );
        } else if (result.statusCode == 401 || result.statusCode == 403) {
          logout();
        } else {
          Get.snackbar(
            'msg_cancel_order'.tr,
            "Cancel order failed!",
            colorText: ColorConstant.black900,
            duration: const Duration(milliseconds: 2500),
            backgroundColor: ColorConstant.whiteA700,
            icon: CustomImageView(
                width: getSize(16),
                height: getSize(16),
                svgPath: ImageConstant.imgNotify),
          );
          Logger.log(
              "OrderDetailsController error at cancelOrder: ${result.statusCode}, \n${result.body}");
        }
      });
    } catch (e) {
      Get.snackbar(
        'msg_cancel_order'.tr,
        "Cancel order failed!",
        colorText: ColorConstant.black900,
        duration: const Duration(milliseconds: 2500),
        backgroundColor: ColorConstant.whiteA700,
        icon: CustomImageView(
            width: getSize(16),
            height: getSize(16),
            svgPath: ImageConstant.imgNotify),
      );
      Logger.log(
          "OrderDetailsController ERROR at cancelOrder: ${e.toString()}");
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  void logout() {
    PrefUtils.clearPreferencesData();
    Map<String, bool> arg = {"timeOut": true};
    Get.offAllNamed(AppRoutes.loginScreen, arguments: arg);
  }

  void getBack() {
    Get.back();
  }
}
